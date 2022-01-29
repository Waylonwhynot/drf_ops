
from django.db import models
from jsonfield import JSONField

from Stargate.utils.models import CbaseModel
from .model import Info

class Data(CbaseModel):
    """
    数据
    """    
    STATUS = (
        (0, "无状态"),
        (1, "空闲"),
        (2, "故障"),
        (3, "待回收"),
        (4, "正在使用"),
    )
    uuid = models.UUIDField(unique=True, verbose_name="唯一识别ID")
    info = models.ForeignKey(Info, on_delete=models.CASCADE, verbose_name="对应的模型")
    status = models.PositiveSmallIntegerField(default=0, choices=STATUS, verbose_name="状态")
    data = JSONField(verbose_name="数据")

    def __str__(self):
        return self.uuid

    # @property
    # def info_identifies(self):
    #     return self.info.identifies

    @property
    def info_names(self):
        return self.info.name

    @property
    def tags(self):
        tag_list = self.tag_info.all().values_list('tag', flat=True).order_by('id')
        return tag_list


    class Meta:
        db_table = "cmdb_resource_data"
        verbose_name = "数据"
        verbose_name_plural = verbose_name
        ordering = ['id']


class DataRelated(CbaseModel):
    """
    数据关系
    """    
    source = models.ForeignKey(Data, on_delete=models.CASCADE, verbose_name="源数据", related_name="source_data")
    target = models.ForeignKey(Data, on_delete=models.CASCADE, verbose_name="目标数据", related_name="target_data")
    source_info = models.ForeignKey(Info, on_delete=models.CASCADE, verbose_name="源模型", related_name="source_info")
    target_info = models.ForeignKey(Info, on_delete=models.CASCADE, verbose_name="目标模型", related_name="target_info")

    def __str__(self):
        return self.pk
    
    class Meta:
        db_table = "cmdb_resource_data_related"
        verbose_name = "数据关系"
        verbose_name_plural = verbose_name
        ordering = ['id']
        unique_together = (("source", "target"),("source_info", "target_info"))
