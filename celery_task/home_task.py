# -*- coding: utf-8 -*-

from .celery import app
from django_redis import get_redis_connection
from Stargate.libs.bce import bceclient
import json


# 首页饼图
@app.task
def update_dashboard(bind=True):
    # 直接写入/更新redis
    res_blb = bceclient.list_blb()
    res_app_blb = bceclient.list_app_blb()
    res_bcc = bceclient.list_bcc()
    res_rds = bceclient.list_rds()
    res_cce = bceclient.list_cce()
    # 计数
    blb_count = len(res_blb['blbList'])
    app_blb_count = len(res_app_blb['blbList'])
    bcc_count = len(res_bcc['instances'])
    rds_count = len(res_rds['instances'])
    cce_count = res_cce['clusterPage']['totalCount']
    # 为True, 则后面分页还有数据
    while res_blb['isTruncated']:
        # 结束位置,下一次循环起始位置
        next_marker = res_blb['nextMarker']
        res_blb = bceclient.list_blb(params={"marker": next_marker, "nextMarker": ''})
        blb_count += len(res_blb['blbList'])
    while res_app_blb['isTruncated']:
        # 结束位置,下一次循环起始位置
        next_marker = res_app_blb['nextMarker']
        res_app_blb = bceclient.list_app_blb(params={"marker": next_marker, "nextMarker": ''})
        app_blb_count += len(res_app_blb['blbList'])
    while res_bcc['isTruncated']:
        # 结束位置,下一次循环起始位置
        next_marker = res_bcc['nextMarker']
        res_bcc = bceclient.list_bcc(marker=next_marker)
        bcc_count += len(res_bcc['instances'])
    while res_bcc['isTruncated']:
        # 结束位置,下一次循环起始位置
        next_marker = res_rds['nextMarker']
        res_rds = bceclient.list_rds(marker=next_marker)
        rds_count += len(res_rds['instances'])

    count_data = [{'name': 'BLB', 'value': blb_count}, {'name': 'APP_BLB', 'value': app_blb_count},
            {'name': 'BCC', 'value': bcc_count}, {'name': 'RDS', 'value': rds_count},
            {'name': 'CCE', 'value': cce_count}]
    # 写入/更新redis
    conn = get_redis_connection('dashboard')
    conn.set('bdcloudresourcecount', json.dumps(count_data))
    conn.expire('bdcloudresourcecount', 60 * 60 * 48) # 过期时间2天

