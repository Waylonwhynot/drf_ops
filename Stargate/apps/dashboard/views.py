import json

from django.shortcuts import render

# Create your views here.
from rest_framework.views import APIView
from Stargate.libs.bce import bceclient
from Stargate.utils.response import APIResponse
from Stargate.utils.logging import get_logger
from django_redis import get_redis_connection

error_logger = get_logger('error')


class BdcloudListResources(APIView):
    """
    统计云资源; 首页饼图
    todo: 后期优化逻辑; 定时读取redis写本地缓存；缓存没有，查本地缓存。
    """
    authentication_classes = []
    permission_classes = []

    def get(self, request):
        try:
            conn = get_redis_connection('dashboard')
            if conn.exists('bdcloudresourcecount'):
                data = json.loads(conn.get('bdcloudresourcecount'))
            return APIResponse(data=data)
        except BaseException as e:
            error_logger.error('缓存问题: %s' % str(e))
            return APIResponse(code=1, status='failed', errors=str(e))

