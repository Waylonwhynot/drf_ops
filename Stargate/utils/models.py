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


class BaseModel(models.Model):

    is_show = models.BooleanField(default=True, verbose_name="是否显示")
    orders = models.IntegerField(default=1, verbose_name="排序")
    is_deleted = models.BooleanField(default=False, verbose_name="是否删除")
    created_time = models.DateTimeField(auto_now_add=True, verbose_name="添加时间")
    updated_time = models.DateTimeField(auto_now=True, verbose_name="修改时间")
    class Meta:
        # 数据库迁移时，设置了bstract = True的model类不会生成数据库表
        abstract = True