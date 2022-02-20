from django.db import models
from host.models import Host


# Create your models here.

# 任务记录表
class TaskSchedule(models.Model):
    period_way_choices = (
        ('1', '普通周期'),
        ('2', '一次性任务'),
        ('3', 'cron任务'),
    )
    status_choices = (
        ('1', '激活'),
        ('2', '停止'),
        ('3', '报错'),

    )

    # user = models.ForeignKey(User)
    period_beat = models.IntegerField(verbose_name='django-celery-beat任务id', help_text='方便我们通过这个id值来控制celery的任务状态',
                                      null=True, blank=True)
    task_name = models.CharField(max_length=32, verbose_name='任务名称')
    task_cmd = models.TextField(verbose_name='任务指令')
    # 是否通知
    # 通知方式
    # 通知内容
    period_way = models.CharField(max_length=32, choices=period_way_choices, default='1', verbose_name='任务周期方式')
    period_content = models.CharField(max_length=32, verbose_name='周期计划')  # 10秒、*****cron方式，datetime时间等
    period_status = models.CharField(max_length=32, default='1', choices=status_choices)


# 任务和主机的关系表
class TaskHost(models.Model):
    tasks = models.ForeignKey('TaskSchedule', on_delete=models.CASCADE, verbose_name='执行的任务')
    hosts = models.ForeignKey(Host, on_delete=models.CASCADE, verbose_name='任务执行主机')

