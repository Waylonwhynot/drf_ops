from django.shortcuts import render

# Create your views here.
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import status
from rest_framework.filters import SearchFilter
from rest_framework.generics import ListAPIView, CreateAPIView
from rest_framework.views import APIView

from host.models import Host
from .models import CmdTemplate, CmdTemplateCategory
from utils.handle_key import AppSetting
from utils.response import APIResponse
from .serializer import HostModelSerializer, TemplateModelSerialzer, TemplateCategoryModelSerialzer
from utils.pagination import BasicPagination
from utils.views import CommonModelViewSet, CommonReadOnlyModelViewSet


class MTaskView(APIView):
    pass


class HostView(CommonReadOnlyModelViewSet):
    queryset = Host.objects.all()
    serializer_class = HostModelSerializer
    filter_backends = [DjangoFilterBackend]
    filter_fields = ['hostname', 'category']


# 获取所有执行模板
class TemplateView(ListAPIView, CreateAPIView):
    queryset = CmdTemplate.objects.all()
    serializer_class = TemplateModelSerialzer


# 获取执行模板类别
class TemplateCategoryView(ListAPIView):
    queryset = CmdTemplateCategory.objects.all()
    serializer_class = TemplateCategoryModelSerialzer


# 执行指令的接口
class CmdExecView(APIView):

    def post(self, request, *args, **kwargs):
        ids = request.data.get('ids')
        cmd = request.data.get('cmd')
        print('ids, cmd', ids, cmd)
        if ids and cmd:
            exec_host_list = Host.objects.filter(id__in=ids)
            pkey = AppSetting.get('private_key')
            response_list = []
            # todo: 需要加入并发, 利用多线程
            for host in exec_host_list:
                cli = host.get_ssh(pkey)
                res_code, res_data = cli.exec_command(cmd)
                # res_code 0 ok, 不为0 指令有问题
                response_list.append({
                    'host_info': {
                        'id': host.id,
                        'hostname': host.hostname,
                        'ip_addr': host.ip_addr,
                        'port': host.port
                    },
                    'res_code': res_code,
                    'res_data': res_data
                })
            print(response_list)
            return APIResponse(data=response_list)
        else:
            return APIResponse(code=1, errors='没有该主机或者没有输入指令', status=status.HTTP_400_BAD_REQUEST)
