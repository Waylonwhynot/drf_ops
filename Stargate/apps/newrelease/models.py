from django.db import models

# Create your models here.
from utils.functions import GenerateShortId
from utils.models import BaseModel
from django.contrib.auth import get_user_model

User = get_user_model()


class ReleaseApp(BaseModel):
    name = models.CharField(max_length=32)
    app_id = models.CharField(default=GenerateShortId, editable=False, max_length=32, unique=True, verbose_name='应用唯一标识号')
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, verbose_name='用户')
    remark = models.TextField(verbose_name='备注信息', null=True, blank=True)
