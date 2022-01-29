from django.db import models


class CbaseModel(models.Model):
    """
    基础配置
    """

    change_user = models.CharField(max_length=64, blank=True, null=True, verbose_name='修改人', default='admin')
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    update_time = models.DateTimeField(auto_now=True, verbose_name='更新时间')

    class Meta:
        abstract = True  # 抽象类，不生成数据库表
