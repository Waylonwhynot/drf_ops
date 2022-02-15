from django.db import models
from host.models import Host
# Create your models here.

class CmdTemplateCategory(models.Model):

    name = models.CharField(max_length=32,verbose_name='类别名称')

    def __str__(self):
        return self.name

class CmdTemplate(models.Model):
    '''默认模板为 指令操作 id为1'''
    tname = models.CharField(max_length=32,null=True,blank=True)
    category = models.ForeignKey('CmdTemplateCategory',on_delete=models.CASCADE,verbose_name='模板类别')
    cmd = models.TextField(verbose_name='模板内容')
    desc = models.TextField(verbose_name='描述信息',null=True,blank=True)

# 主机和指令的关系表
class CmdExexHistory(models.Model):
    exec_time = models.DateTimeField(auto_now_add=True,verbose_name='指令执行时间')

    hosts = models.ForeignKey(Host,on_delete=models.CASCADE, null=True, blank=True)
    template = models.ForeignKey('CmdTemplate', on_delete=models.CASCADE, null=True, blank=True)