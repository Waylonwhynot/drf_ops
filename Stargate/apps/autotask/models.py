from django.db import models

# Create your models here.

class Tasks(models.Model):
    name = models.CharField(max_length=128, verbose_name='任务名称')
    playbook = models.FileField(upload_to='playbook/%Y/%m', verbose_name='playbook文件')
    detail_result = models.TextField(verbose_name='执行结果详情', null=True, blank=True)
    status = models.CharField(max_length=1, choices=(('Y', '已执行'), ('N', '未执行')), default='N', verbose_name='执行状态')
    add_time = models.DateTimeField(auto_now_add=True, verbose_name='任务创建时间')
    exec_time = models.DateTimeField(auto_now=True, verbose_name='执行时间')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '任务'
        verbose_name_plural = verbose_name
        ordering = ['-add_time']
