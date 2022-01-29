# -*- coding: utf-8 -*-

import uuid

from django.db import models

# Create your models here.
from Stargate.utils.functions import GenerateShortId
from Stargate.utils.models import CbaseModel


class AppID(CbaseModel):
    appid = models.CharField(default=GenerateShortId, max_length=32, editable=False, verbose_name='应用ID')
    appname = models.CharField(max_length=64, unique=True, verbose_name='应用名称')
    desc = models.CharField(max_length=50, blank=True, null=True, verbose_name="应用描述")

    def __str__(self):
        return self.appname

    class Meta:
        verbose_name = "应用id"
        verbose_name_plural = verbose_name
        ordering = ['create_time']


class WxMsgLogs(models.Model):
    """
    消息日志
    """
    status_list = (
        ('success', '发送成功'),
        ('failed', '发送失败')
    )
    appid = models.ForeignKey("AppID", null=True, blank=True, on_delete=models.SET_NULL, verbose_name="应用ID")
    msg_date = models.DateTimeField(auto_now_add=True, verbose_name='发送时间')
    msg_type = models.CharField(max_length=64, verbose_name='消息类型')
    msg = models.TextField(max_length=40960, verbose_name="消息内容")
    status = models.CharField(choices=status_list, max_length=16, default="success", verbose_name="发送状态")
    detail = models.TextField(verbose_name='详情')

    def __str__(self):
        return self.appid

    class Meta:
        verbose_name = "微信消息日志"
        verbose_name_plural = verbose_name
        ordering = ['-msg_date']
