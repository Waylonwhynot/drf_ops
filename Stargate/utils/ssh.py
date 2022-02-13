# -*- coding: utf-8 -*-

from paramiko.client import SSHClient, AutoAddPolicy
from paramiko.config import SSH_PORT
from paramiko.rsakey import RSAKey
from paramiko.ssh_exception import AuthenticationException
from io import StringIO


class SSH:
    def __init__(self, hostname, port=SSH_PORT, username='root', pkey=None, password=None, connect_timeout=10):
        if pkey is None and password is None:
            raise Exception('私钥或者密码必须有一个不为空')
        self.client = None
        self.arguments = {
            'hostname': hostname,
            'port': port,
            'username': username,
            'password': password,
            'pkey': RSAKey.from_private_key(StringIO(pkey)) if isinstance(pkey, str) else pkey,
            # 'pkey': pkey,
            'timeout': connect_timeout,
        }
        print(self.arguments)

    @staticmethod
    def generate_key():  # 生成公私钥键值对
        key_obj = StringIO()
        key = RSAKey.generate(2048)
        key.write_private_key(key_obj)
        return key_obj.getvalue(), 'ssh-rsa ' + key.get_base64()

    # 将公钥上传到对应主机
    def add_public_key(self, public_key):
        command = f'mkdir -p -m 700 ~/.ssh && \
        echo {public_key!r} >> ~/.ssh/authorized_keys && \
        chmod 600 ~/.ssh/authorized_keys'
        code, out = self.exec_command(command)
        if code != 0:
            raise Exception(f'添加公钥失败: {out}')

    # 检测连接并获取连接
    def ping(self):
        with self:
            return True

    # 直接获取连接
    def get_client(self):
        if self.client is not None:
            return self.client
        try:
            self.client = SSHClient()
            self.client.set_missing_host_key_policy(AutoAddPolicy)
            # print('2222self.client>>>>', self.client)
            self.client.connect(**self.arguments)
        except Exception as e:
            return None
        # print('self.client>>>>',self.client)
        return self.client

    # 指定上文文件的路径
    def put_file(self, local_path, remote_path):
        with self as cli:
            sftp = cli.open_sftp()
            sftp.put(local_path, remote_path)
            sftp.close()

    def exec_command(self, command, timeout=1800, environment=None):
        command = 'set -e\n' + command
        with self as cli:
            chan = cli.get_transport().open_session()
            chan.settimeout(timeout)
            chan.set_combine_stderr(True)
            # if environment:
            #     str_env = ' '.join(f"{k}='{v}'" for k, v in environment.items())
            #     command = f'export {str_env} && {command}'
            chan.exec_command(command)
            stdout = chan.makefile("rb", -1)
            return chan.recv_exit_status(), self._decode(stdout.read())

    # 上传文件，根据文件对象(文件句柄或类文件句柄)上传到指定目录下
    def put_file_by_fl(self, fl, remote_path, callback=None):
        with self as cli:
            sftp = cli.open_sftp()
            sftp.putfo(fl, remote_path, callback=callback)

    # 从远程主机下载文件到本地
    def download_file(self, local_path, remote_path):
        with self as cli:
            sftp = cli.open_sftp()
            sftp.get(remote_path, local_path)

    # 获取指定目录路径下的文件和文件夹列表详细信息,结果为列表，列表里面的每一项是from paramiko.sftp_attr import SFTPAttributes  类的对象，通过对象.属性可以获取对应的数据，比如获取修改时间用对象.st_mtime
    def list_dir_attr(self, path):
        with self as cli:
            sftp = cli.open_sftp()
            return sftp.listdir_attr(path)

    # 根据指定路径删除对应文件,没有对应文件会报错，有返回None
    def remove_file(self, path):
        with self as cli:
            sftp = cli.open_sftp()
            sftp.remove(path)

    # 删除远程主机上的目录
    def remove_dir(self, target_path):
        with self as cli:
            sftp = cli.open_sftp()
            sftp.rmdir(target_path)

    # 获取文件详情
    def file_stat(self, remote_path):
        with self as cli:
            sftp = cli.open_sftp()
            return sftp.stat(remote_path)

    # 编码方法
    def _decode(self, out: bytes):
        try:
            return out.decode()
        except UnicodeDecodeError:
            return out.decode('GBK')

    # with self: 先执行__enter__方法
    def __enter__(self):
        if self.client is not None:
            raise RuntimeError('已经建立连接了！！！')
        return self.get_client()

    # with self:语句体内容结束后执行如下方法 先执行__enter__方法
    def __exit__(self, exc_type, exc_val, exc_tb):
        self.client.close()
        self.client = None

