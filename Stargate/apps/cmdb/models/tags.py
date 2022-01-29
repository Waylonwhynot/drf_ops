
from django.db import models

from Stargate.utils.models import CbaseModel
from .resources import Data

class Tag(CbaseModel):
    """
    标签管理
    """    
    tag_name = models.CharField(max_length=50, verbose_name="标签名称")
    tag_value = models.CharField(max_length=50, verbose_name="标签值")

    def __str__(self):
        return f"{self.tag_name}: {self.tag_value}"
    
    @property
    def datas(self):
        data_list = DataTagRelated.objects.filter(tag=self.pk).values_list('data', flat=True).order_by('id')
        return data_list

    class Meta:
        db_table = "cmdb_tags_tag"
        verbose_name = "标签管理"
        verbose_name_plural = verbose_name
        ordering = ['id']
        unique_together = (("tag_name", "tag_value"),)

class DataTagRelated(CbaseModel):
    """
    数据和标签关联
    """    
    data = models.ForeignKey(Data, on_delete=models.CASCADE, verbose_name="资源数据", related_name="tag_info")
    tag = models.ForeignKey(Tag, on_delete=models.CASCADE, verbose_name="资源数据", related_name="data_info")

    def __str__(self):
        return self.pk
    
    class Meta:
        db_table = "cmdb_tags_data_related"
        verbose_name = "数据和标签关联关系"
        verbose_name_plural = verbose_name
        unique_together = (("data", "tag"),)

    




