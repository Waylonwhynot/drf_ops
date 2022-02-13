# -*- coding: utf-8 -*-


import uuid

chars = ["A", "B", "C", "D", "E", "F", "G", "H", "I",
         "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
         "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5",
         "6", "7", "8", "9"]


def GenerateShortId():
    id = str(uuid.uuid4()).replace('-', '')
    buffer = []
    for i in range(0, 8):
        start = i * 4
        end = i * 4 + 4
        # 16转10进制
        val = int(id[start:end], 16)
        buffer.append(chars[val % 36])
    return "".join(buffer)

# print(GenerateShortId())

import paramiko
import traceback
from paramiko.ssh_exception import AuthenticationException

pkey = PkeyModel.objects.get(key='private_key').value
pkey = RSAKey.from_private_key(StringIO(pkey))
ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
try:
    ssh.connect(hostname='8.129.90.123', port=22, username='root', password='Lxw951102..', timeout=10) # 1. 直接密码远程连接的方式
    #注意，如果你测试某个服务器的连接时，如果你本地已经配置了这个远程服务器的免密登录(公私钥模式)，那么就不能测试出密码是否正确了，因为首先会通过公私钥模式登录，不会使用你的密码的。
    # ssh.connect(hostname='39.102.132.191', port=22, username='root', pkey=pkey, timeout=10) # 2. 使用秘钥免密登录的方式
    stdin, stdout, stderr = ssh.exec_command('pwd')
    result = stdout.read()
    print(result)
    ssh.close()
except AuthenticationException as e:
    # print(e.message)
    print(str(e))
    print('连接失败，请检查参数是否正确！')
    # print(traceback.format_exc())
    # print(ret)
