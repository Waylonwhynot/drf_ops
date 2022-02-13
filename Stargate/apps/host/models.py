from django.db import models

# Create your models here.
from utils.models import BaseModel
# Create your models here.
from django.contrib.auth import get_user_model
from utils.ssh import SSH

User = get_user_model()

# 全局密钥和共钥，所有用户都使用这个一对
class PkeyModel(BaseModel):
    key = models.CharField(max_length=50, unique=True) # ssh私钥
    value = models.TextField() # 私钥值
    desc = models.CharField(max_length=255, null=True)  # 简单描述

    def __repr__(self):
        return '<Pkey %r>' % self.key


# 主机表
class Host(BaseModel):
    # name = models.CharField(max_length=50,verbose_name='主机别名')
    # zone = models.CharField(max_length=50, verbose_name='主机类别')
    category = models.ForeignKey('HostCategory',on_delete=models.CASCADE, verbose_name='主机类别', related_name='hc', null=True, blank=True)

    hostname = models.CharField(max_length=50,verbose_name='主机名称')
    ip_addr = models.CharField(blank=True, null=True,max_length=50,verbose_name='连接地址')
    port = models.IntegerField(verbose_name='端口')
    username = models.CharField(max_length=50,verbose_name='登录用户')
    # pkey = models.TextField(blank=True, null=True,verbose_name='ssh登录密钥')
    desc = models.CharField(max_length=255, null=True,verbose_name='描述')

    users = models.ManyToManyField(User)
    def __str__(self):
        return self.hostname + ':' + self.ip_addr


    def get_ssh(self, pkey=None):
        # pkey = pkey or self.private_key

        return SSH(self.ip_addr, self.port, self.username, pkey)

class HostCategory(BaseModel):

    name = models.CharField(max_length=32, verbose_name='主机类别', unique=True)

    def __str__(self):
        return self.name