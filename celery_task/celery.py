# -*- coding: utf-8 -*-

import celery
import os
from django.utils import timezone
from celery_task import celery_config

# 为celery程序设置Django配置
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "Stargate.settings")

# 创建celery应用
app = celery.Celery('celery_task')

# 导入celery配置
app.config_from_object(celery_config)

# 加载celery任务模块
app.autodiscover_tasks([
    'celery_task.home_task',
    'celery_task.send_alert_task',
    'celery_task.tasks',
])


# 时区
app.conf.timezone = 'Asia/Shanghai'

# 是否使用UTC
app.conf.enable_utc = False

# 任务的定时配置
# from celery.schedules import crontab

### 配置死的定时任务，无法动态
# 'schedule': crontab(minute=0, hour=0), # 午夜0点
# app.conf.beat_schedule = {
#     'update-dashboard': {
#         'task': 'celery_task.home_task.update_dashboard',
#         # 'schedule': crontab(),
#         'schedule': crontab(minute=0, hour=0),
#         # 'args': (),
#     }
# }



### worker启动命令
# celery - A celery_task worker - l info

### beat启动命令（启动celery-beat的DatabaseScheduler 数据库调用器 作为定时任务的调度器）
# celery -A celery_task beat -l info --scheduler django_celery_beat.schedulers:DatabaseScheduler