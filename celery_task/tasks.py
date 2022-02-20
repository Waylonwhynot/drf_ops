# -*- coding: utf-8 -*-
import json

from celery_task.celery import app

# 创建任务函数
from host.models import Host
from utils.handle_key import AppSetting


@app.task
def my_task1(a, b, c):
    print("任务1函数正在执行....")
    return a + b + c

@app.task
def my_task2():
    print("任务2函数正在执行....")


# 周期性任务，比如数据库备份
# 执行定时计划的任务
@app.task(name='schedule_task')
def schedule_task(cmd, hosts_ids):
    print(1111)
    hosts_objs = Host.objects.filter(id__in=hosts_ids)
    print(hosts_objs)
    result_data = []
    pkey = AppSetting.get('private_key')
    # print('pkey>>>>',pkey)
    for host_obj in hosts_objs:
        cli = host_obj.get_ssh(pkey)
        status, result = cli.exec_command(cmd)
        result_data.append({
            'host_id':host_obj.id,
            'host':host_obj.ip_addr,
            'status':status,
            'result':result
        })
        print('>>>>',status, result)
    return json.dumps(result_data)
    # return '22222'

