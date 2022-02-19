import subprocess

from channels.generic.websocket import WebsocketConsumer
from host.models import Host
from threading import Thread
import json
from host.models import PkeyModel
from django.conf import settings

from newrelease.models import ReleaseApply
from utils.handle_key import AppSetting


class SSHConsumer(WebsocketConsumer):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.id = self.scope['url_route']['kwargs']['id']
        print('>>>>id', self.id)
        # print(self.scope['url_route'])
        self.chan = None
        self.ssh = None

    # 3 接受连接返回结果并返回给客户端    # 5 接受主机指令的执行结果，并返回给客户端
    def loop_read(self):

        while True:
            data = self.chan.recv(32 * 1024)
            if not data:
                self.close(3333)
                break
            self.send(data.decode())

    # 4 结果客户端发送过来的指令，并发送给主机执行指令
    def receive(self, text_data=None, bytes_data=None):
        data = text_data or bytes_data
        print('receive:  xxxxxx', data, type(data))
        # 这个地方就可以 哪个用户，操作了哪些指令，就可以保存下来；保存日志，做一些审计之类的事情

        if data:
            self.chan.send(data + '\r\n')

    def disconnect(self, code):
        self.chan.close()
        self.ssh.close()
        print('Connection close')

    # 1 请求来了自动触发父类connect方法，我们继承拓展父类的connect方法，因为我们和客户端建立连接的同时，就可以和客户端想要操作的主机建立一个ssh连接通道。
    def connect(self):
        print('connect连接来啦74')
        self.accept()  # 建立websocket连接
        self._init()  # 建立和主机的ssh连接

    # 2 建立和主机的ssh连接
    def _init(self):
        # self.send(bytes_data=b'Connecting ...\r\n')
        self.send('Connecting ...\r\n')  # 通过服务端直接给客户端通过websocket建立的链接通道，发了一条信息给客户端
        host = Host.objects.filter(pk=self.id).first()
        if not host:
            self.send(text_data='Unknown host\r\n')
            self.close()  # 关闭websocket连接
        try:
            pkey = PkeyModel.objects.get(key='private_key').value
            self.ssh = host.get_ssh(pkey).get_client()
        except Exception as e:
            self.send(f'Exception: {e}\r\n')
            self.close()
            return

        self.chan = self.ssh.invoke_shell(
            term='xterm')  # invoke_shell激活shell终端模式，也就是长连接模式，exec_command()函数是将服务器执行完的结果一次性返回给你；invoke_shell()函数类似shell终端，可以将执行结果分批次返回，所以我们接受数据时需要循环的取数据

        self.chan.transport.set_keepalive(30)  # 连接中没有任何信息时，该连接能够维持30秒

        # 和主机的连接一旦建立，主机就会将连接信息返回给服务端和主机的连接通道中，并且以后我们还要在这个通道中进行指令发送和指令结果的读取，所以我们开启单独的线程，去连接中一直等待和获取指令执行结果的返回数据
        Thread(target=self.loop_read).start()


# 执行代码发布
def put_code_to_target(host_obj, cli, cmd_list, self):
    for cmd_info in cmd_list:
        self.send(cmd_info.get('msg'))
        if cmd_info.get('step') == '5':
            try:
                cli.put_file(cmd_info.get('local_path'), cmd_info.get('remote_path'))
            except Exception as e:
                error_msg = {
                    'step': cmd_info.get('step'),
                    'error': str(e),  # e是一个exception 对象，str(e) 相当于调用了对象的__str__ 方法
                    'ip_addr': host_obj.ip_addr,  # 错误主机ip地址
                    'hostname': host_obj.hostname,  # 错误主机名称
                    'status': 1,  # status不等于0 表示有错误
                }
                error_msg_str = json.dumps(error_msg)
                self.close()
                break
        else:

            code, output = cli.exec_command(cmd_info.get('cmd'))

            if code != 0:
                # host_obj
                error_msg = {
                    'step': cmd_info.get('step'),
                    'error': output,
                    'ip_addr': host_obj.ip_addr,  # 错误主机ip地址
                    'hostname': host_obj.hostname,  # 错误主机名称
                    'status': 1,  # status不等于0 表示有错误
                }
                error_msg_str = json.dumps(error_msg)

                self.send(error_msg_str)  # 发送错误信息
                self.close()  # 关闭socket通道
                break


# 发布过程记录的类
class ReleaseConsumer(WebsocketConsumer):
    """
    通过发布申请表-发布申请记录的id == 发布申请的一条记录对象
    1.检出前 -- 创建仓库同名记录
    2.检出后 --
    3.发布前 --
    4.发布后 --
    """

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # self.user = self.scope['user']
        # print('SSHConsumer>>>41')
        self.id = self.scope['url_route']['kwargs']['id']
        print('>>>>id', self.id)
        # print(self.scope['url_route'])
        self.chan = None
        self.ssh = None

    def connect(self):
        print('发布连接来啦！！！！')
        self.accept()
        self._init()

    def _init(self):
        self.send('Connecting ...\r\n')
        # 查询本次发布的记录
        release_apply_obj = ReleaseApply.objects.filter(pk=self.id).first()
        release_record_obj = release_apply_obj.release_record
        # print(release_record_obj)

        # 1 检出(git clone)前的动作
        self.send('执行检出前的动作。。。')

        '''
            filefilterway   文件过滤方式
            file_filter_cmd_content  过滤的文件或目录
            before_code_check_out_value  代码检出前的指令(针对本机)
            before_release_content  代码发布前的指令(针对目标主机)
            custom_global_variable 部署运行的项目时给项目设置的全局变量
            after_code_check_out_value  代码检出后的指令(针对本机)
            after_release_value 代码发布后的指令(针对目标主机)
        '''

        code, output = subprocess.getstatusoutput(release_record_obj.before_code_check_out_value)
        # code, output = subprocess.getstatusoutput(release_record_obj.before_code_check_out_value)
        if code != 0:
            error_msg = {
                'step': 1,  # 表示自动化部署进行到第几步了
                'error': output,  # 错误信息
                'status': 1,  # status不等于0，表示有错误
            }
            error_msg_str = json.dumps(error_msg)

            self.send(error_msg_str)  # 发送错误信息
            self.close()  # 并关闭wbsocket通道
            # 并还原为执行动作之前的状态（这里我就不写了）
            return code
        self.send('执行代码检出前动作完成。。。')

        # 2 检出代码
        self.send('执行代码检出中。。。')
        git_attr = release_record_obj.code_git_addr
        # # 获取项目名称，方便后面创建文件夹和打包项目代码目录
        project_name = git_attr.rsplit('/')[-1].split('.')[0].strip()
        # print('project_name>>', project_name)
        code, output = subprocess.getstatusoutput(f'cd {settings.RELEASE_LOCAL_PATH} && git clone {git_attr}')

        # code, output = subprocess.getstatusoutput(f'git clone {release_record_obj.code_git_addr}')
        if code != 0:
            error_msg = {
                'step': 2,
                'error': output,
                'status': 1,
            }
            error_msg_str = json.dumps(error_msg)

            self.send(error_msg_str)  # 发送错误信息
            self.close()  # 并关闭wbsocket通道
            # 并还原为执行动作之前的状态
            return False

        self.send('执行代码检出完成。。。')
        # 3 检出后动作
        self.send('执行代码检出后的动作。。。')
        # 进入目录，切换分支，git reset --hard commitid -- 剃出过滤文件 （ 后面优化 再做吧）
        code, output = subprocess.getstatusoutput(
            f'cd {settings.RELEASE_LOCAL_PATH} {project_name} && {release_record_obj.after_code_check_out_value} {project_name}.tar.gz {project_name}')
        # code, output = subprocess.getstatusoutput(release_record_obj.after_code_check_out_value)
        if code != 0:
            error_msg = {
                'step': 3,
                'error': output,
                'status': 1,
            }
            error_msg_str = json.dumps(error_msg)
            self.send(error_msg_str)  # 发送错误信息

            self.close()  # 并关闭wbsocket通道
            # 并还原为执行动作之前的状态

        self.send('执行代码检出后的动作完成。。。')
        # 如果检出没有问题的话，代码继续往下面执行
        # self.send('执行代码发布前动作。。。')
        # 后面3步是在点击发布的时候进行的

        # 4 发布前，对目标主机执行的动作

        release_record_detail_list = release_record_obj.release_record.all()

        # 根据本次发布查询到的主机列表
        target_host_list = []
        for record_detail in release_record_detail_list:
            target_host_list.append(record_detail.hosts)

        # 开启多线程或者线程池来并发执行多个主机的代码推送
        # 并且将推送的结果和错误保存到redis中，
        # 将代码发布前  发布  发布后的指令作为成一个列表交给线程任务
        cmd_list = [
            {'step': '4', 'cmd': release_record_obj.before_release_content, 'msg': '代码发布前动作。。。', },

            {'step': '5', 'cmd': 'ls', 'msg': '代码发布中。。。',
             'local_path': f'{settings.RELEASE_LOCAL_PATH}/{project_name}.tar.gz',
             'remote_path': f'{release_record_obj.target_host_pub_path}/{project_name}.tar.gz'},

            {'step': '6', 'cmd': release_record_obj.after_release_value, 'msg': '代码发布后动作。。。', }

        ]

        # print('---',target_host_list)
        # pkey = AppSetting.get('private_key')
        # for host_obj in target_host_list:
        #     cli = host_obj.get_ssh(pkey)
        #     put_code_to_target(host_obj,cli,cmd_list, self)

        pkey = AppSetting.get('private_key')
        t_list = []
        for host_obj in target_host_list:
            cli = host_obj.get_ssh(pkey)
            # print(cli)
            t = Thread(target=put_code_to_target, args=(host_obj, cli, cmd_list, self))
            t.start()
            t_list.append(t)

        for tt in t_list:
            tt.join()

        # self.send(json.dumps(a))
        self.send('代码发布完成！！！！')

        # self.close()  # 并关闭wbsocket通道
        # 并还原为执行动作之前的状态
