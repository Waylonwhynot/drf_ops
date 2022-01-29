

from django.db import models
from jsonfield import JSONField
from Stargate.utils.models import CbaseModel


class Group(CbaseModel):
    """
    模型分组
    """    
    identifies = models.CharField(max_length=128, unique=True, db_index=True, verbose_name="分组标识")
    name = models.CharField(max_length=128, verbose_name="分组名称")

    def __str__(self):
        return self.name
    
    class Meta:
        db_table = "cmdb_model_group"
        verbose_name = "模型分组"
        verbose_name_plural = verbose_name
        ordering = ['id']
    @property
    def info_list(self):
        return self.groups.all()

class Info(CbaseModel):
    """
    模型
    """    
    identifies = models.CharField(max_length=128, unique=True, db_index=True, verbose_name="模型标识")
    name = models.CharField(max_length=128, verbose_name="模型名称")
    icon = models.CharField(max_length=128, verbose_name="模型图标")
    is_usable = models.BooleanField(default=True, verbose_name="是否可用")
    group = models.ForeignKey(Group, on_delete=models.CASCADE, verbose_name='模型分组', related_name="groups")

    def __str__(self):
        return self.name

    class Meta:
        db_table = "cmdb_model_info"
        verbose_name = "模型"
        verbose_name_plural = verbose_name
        ordering = ['id']
        unique_together = (("identifies", "group"),)


class InfoRelatedType(CbaseModel):
    """
    模型关系类型
    """    
    DIRECT = (
        (1, "有方向"),
        (2, "双向"),
        (3, "无方向"),
    )
    identifies = models.CharField(max_length=128, unique=True, db_index=True, verbose_name="关系标识")
    name = models.CharField(max_length=128, verbose_name="关系名称")
    source_desc = models.CharField(max_length=200, verbose_name="源-目标描述")
    target_desc = models.CharField(max_length=200, verbose_name="目标-源描述")
    direction = models.PositiveSmallIntegerField(choices=DIRECT, verbose_name="方向")

    def __str__(self):
        return self.name
    
    class Meta:
        db_table = "cmdb_model_related_type"
        verbose_name = "模型关系类型"
        verbose_name_plural = verbose_name
        ordering = ['id']


class InfoRelated(CbaseModel):
    """
    模型和模型之间关系
    """    
    CONSTRAINT_TYPE = (
        (1, '1-1'),
        (2, '1-N'),
        (3, 'N-N'),
    )
    source = models.ForeignKey(Info, on_delete=models.CASCADE, verbose_name="源模型", related_name="related_source")
    target = models.ForeignKey(Info, on_delete=models.CASCADE, verbose_name="目标模型", related_name="related_target")
    related_type = models.ForeignKey(InfoRelatedType, on_delete=models.CASCADE, verbose_name="关系类型")
    constraint = models.PositiveSmallIntegerField(choices=CONSTRAINT_TYPE, verbose_name="源到目的约束")
    remark = models.CharField(max_length=200, default='0', blank=True, verbose_name="关联描述")

    def __str__(self):
        return self.pk

    @property
    def related_name(self):
        return self.related_type.name

    class Meta:
        db_table = "cmdb_model_info_related"
        verbose_name = "模型关系"
        verbose_name_plural = verbose_name
        ordering = ['id']
        unique_together = (("source", "target", "related_type", "constraint"),)


class FieldGroup(CbaseModel):
    """
    字段分组
    """    
    name = models.CharField(max_length=50, verbose_name="分组名称")
    sequence = models.PositiveSmallIntegerField(default=999, verbose_name="分组显示顺序")
    is_fold = models.BooleanField(default=False, verbose_name="是否折叠")
    info = models.ForeignKey(Info, on_delete=models.CASCADE, verbose_name="模型", related_name="infos")

    def __str__(self):
        return self.name
    
    class Meta:
        db_table = "cmdb_model_field_group"
        verbose_name = "字段分组"
        verbose_name_plural = verbose_name
        ordering = ['id', 'sequence']
        unique_together = (("name", "info"),)


class Fields(CbaseModel):
    """
    字段
    """    
    F_TYPE = (
        ('string', '字符'),
        ('text', '文本'),
        ('number', '数字'),
        ('list', '列表'),
        ('enum', '枚举'),
        ('date', '日期'),
        ('time', '时间'),
        ('bool', '布尔'),
        ('user', '用户'),
    )
    identifies = models.CharField(max_length=128, unique=True, db_index=True, verbose_name="字段标识")
    name = models.CharField(max_length=128, verbose_name="字段名称")
    type = models.CharField(max_length=10, choices=F_TYPE, verbose_name="字段类型")
    is_edit = models.BooleanField(default=True, verbose_name="是否可编辑")
    is_unique = models.BooleanField(default=False, verbose_name="是否唯一")
    required = models.BooleanField(default=False, verbose_name="是否必须填写")
    prompt = models.CharField(max_length=200, default='unknow', null=True, blank=True, verbose_name="用户提示")
    configuration = JSONField(verbose_name="字段配置项")
    field_group = models.ForeignKey(FieldGroup, on_delete=models.CASCADE, verbose_name='字段分组', related_name="field_groups")
    info = models.ForeignKey(Info, on_delete=models.CASCADE, verbose_name="模型")
    is_list_display = models.BooleanField(default=False, verbose_name="是否列表显示")
    list_display_sort = models.PositiveSmallIntegerField(default=999, verbose_name="列表显示顺序")

    def __str__(self):
        return self.name

    class Meta:
        db_table = "cmdb_model_fields"
        verbose_name = "字段"
        verbose_name_plural = verbose_name
        ordering = ['id']
        unique_together = (("identifies", "info"),('name', 'info'))
