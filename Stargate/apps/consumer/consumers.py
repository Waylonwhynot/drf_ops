from channels.generic.websocket import WebsocketConsumer
from host.models import Host
from threading import Thread
import json
from host.models import PkeyModel


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
        self.send('Connecting ...\r\n') # 通过服务端直接给客户端通过websocket建立的链接通道，发了一条信息给客户端
        host = Host.objects.filter(pk=self.id).first()
        if not host:
            self.send(text_data='Unknown host\r\n')
            self.close() # 关闭websocket连接
        try:
            pkey = PkeyModel.objects.get(key='private_key').value
            self.ssh = host.get_ssh(pkey).get_client()
        except Exception as e:
            self.send(f'Exception: {e}\r\n')
            self.close()
            return

        self.chan = self.ssh.invoke_shell(term='xterm')  # invoke_shell激活shell终端模式，也就是长连接模式，exec_command()函数是将服务器执行完的结果一次性返回给你；invoke_shell()函数类似shell终端，可以将执行结果分批次返回，所以我们接受数据时需要循环的取数据

        self.chan.transport.set_keepalive(30)  # 连接中没有任何信息时，该连接能够维持30秒

        # 和主机的连接一旦建立，主机就会将连接信息返回给服务端和主机的连接通道中，并且以后我们还要在这个通道中进行指令发送和指令结果的读取，所以我们开启单独的线程，去连接中一直等待和获取指令执行结果的返回数据
        Thread(target=self.loop_read).start()
