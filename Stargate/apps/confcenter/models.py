from django.db import models

# Create your models here.

class Environment(models.Model):

    name = models.CharField(max_length=32, verbose_name='环境名称')
    tag = models.CharField(max_length=32, verbose_name='标识符')
    desc = models.CharField(max_length=32, null=True, blank=True, verbose_name='描述信息')
