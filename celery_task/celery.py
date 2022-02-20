# -*- coding: utf-8 -*-

import celery
import os

from django.utils import timezone

from celery_task import celery_config


# 执行django配置文件，环境变量加入
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "Stargate.settings")

# redis密码配置
# REDIS_PWD = os.getenv('REDIS_PWD', '123')
# if REDIS_PWD:
#     REDIS_STR = f':{REDIS_PWD}@'
# else:
#     REDIS_STR = ''

# env = os.environ.get('ENV', None)
# if env and env == 'PRD':
#     # 消息中间件
#     broker = f'redis://{REDIS_STR}127.0.0.1:6379/9'
#     print(broker)
#     # 结果存储
#     backend = f'redis://{REDIS_STR}127.0.0.1:6379/10'
# else:
#     # 消息中间件
#     broker = f'redis://{REDIS_STR}127.0.0.1:6379/9'
#     # broker = 'redis://:12345678@127.0.0.1:6379/9'
#     # 结果存储
#     backend = f'redis://{REDIS_STR}127.0.0.1:6379/10'
#     # backend = 'redis://:12345678@127.0.0.1:6379/10'

# app = celery.Celery('stargate', broker=broker, backend=backend, include=['celery_task.home_task',
#                                                                          'celery_task.send_alert_task'
#                                                                          ])
app = celery.Celery('celery_task')
app.config_from_object(celery_config)

# 设置app自动加载任务
app.autodiscover_tasks([
    'celery_task',
])

# 解决时区问题,定时任务启动就循环输出
# app.now = timezone.now

# 自动从Django的已注册app中发现任务
# app.autodiscover_tasks()

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
