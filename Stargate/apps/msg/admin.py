from django.contrib import admin

# Register your models here.
from .models import AppID, WxMsgLogs

admin.site.register(AppID)
admin.site.register(WxMsgLogs)
