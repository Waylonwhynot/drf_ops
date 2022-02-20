import json
from datetime import datetime, timedelta

from django.shortcuts import render

# Create your views here.

# 获取周期类型数据返回给客户端
from django_celery_beat.models import IntervalSchedule, PeriodicTask
from rest_framework.views import APIView

from schedule import models
from utils.response import APIResponse


class PeriodView(APIView):
    def get(self,request):
        data = models.TaskSchedule.period_way_choices

        return APIResponse(data={'period_way_choices': data})

class TaskView(APIView):
    """
    周期统一按照描述来处理了
    """
    def get(self,request):
        # 1. 获取任务列表数据返回给客户端
        # 2. 去redis中获取每个任务的执行结果展示给客户端
        pass

    def post(self,request):
        task_data = request.data
        print(task_data)
        # {'task_name': 'kkk', 'hosts': [10], 'period_way': '2', 'task_cmd': 'ls', 'period_content': '12'}
        period_way = request.data.get('period_way')
        hosts_ids = request.data.get('hosts')
        task_cmd = request.data.get('task_cmd')  # 要执行的任务指令
        period_content = request.data.get('period_content')
        task_name = request.data.get('task_name') # 任务名称，注意不能重复
        # hosts_obj = Host.objects.filter(id__in=hosts_ids)
        if period_way == '1':  # 普通周期任务,默认单位为秒数，可以选择修改
            schedule, created = IntervalSchedule.objects.get_or_create(
                every=int(period_content),
                period=IntervalSchedule.SECONDS,
            )
            period_obj = PeriodicTask.objects.create(
                interval=schedule,  # we created this above.
                name=task_name,  # simply describes this periodic task.
                # task='celery_tasks.tasks.schedule_task',  # name of task.
                task='schedule_task',  # name of task. 任务别名
                # task='my_task2',  # name of task.
                args=json.dumps([task_cmd, hosts_ids]),
                expires=datetime.utcnow() + timedelta(seconds=30)
            )
            period_beat = period_obj.id
        elif period_way == '2':   # 一次性任务
            period_beat = 1
            pass
        else:  # cron任务
            period_beat = 1
            pass

##### 保存到两个表，可以加个事务
        # 保存任务
        # 后面就可以通过period_beat这个id 控制任务的启动和关闭
        task_schedule_obj = models.TaskSchedule.objects.create(**{
            'period_beat':period_beat, # celery-beat的任务id值
            'period_way':period_way,
            'task_cmd':task_cmd,
            'period_content':period_content,
            'task_name':task_name,
            'period_status':'1' , # 默认为激活状态
        })

        for host_id in hosts_ids:

            models.TaskHost.objects.create(**{
                'tasks_id': task_schedule_obj.id,
                'hosts_id': host_id,
            })


        return APIResponse({'xxx': 'ooo'})