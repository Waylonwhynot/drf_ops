from django.db import models

# Create your models here.
from user.models import UserProfile


class Deploy(models.Model):
    STATUS = (
        (0, '申请'),
        (1, '已审核'),
        (2, '灰度'),
        (3, '上线'),
        (4, '取消上线'),
    )
    name = models.CharField(max_length=40, verbose_name='项目名称')
    version = models.CharField(max_length=40, verbose_name='项目版本')
    info = models.CharField(max_length=100, null=True, verbose_name='版本描述')
    applicant = models.ForeignKey(UserProfile, null=True, verbose_name='申请人', related_name='applicant', on_delete=models.SET_NULL)
    reviewer = models.ForeignKey(UserProfile, null=True, verbose_name='审核人', related_name='reviewer', on_delete=models.SET_NULL)
    assign_to = models.ForeignKey(UserProfile, verbose_name='上线人', null=True, blank=True, related_name='assigned',
                                  on_delete=models.SET_NULL)
    detail = models.TextField(verbose_name='更新详情')
    status = models.IntegerField(default=0, choices=STATUS, verbose_name='上线状态')
    console_output = models.TextField(default='', verbose_name='上线输出结果', help_text='jenkins控制台输出结果')
    apply_time = models.DateTimeField(auto_now_add=True, verbose_name='申请访问')
    deploy_name = models.DateTimeField(auto_now=True, verbose_name='上线完成时间')
