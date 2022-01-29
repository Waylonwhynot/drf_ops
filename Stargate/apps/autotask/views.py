import json

from django.shortcuts import render

# Create your views here.
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import status
from rest_framework.filters import SearchFilter

from .serializers import TasksSerializer
from .models import Tasks
from Stargate.utils.views import CommonModelViewSet
from Stargate.utils.response import APIResponse
from Stargate.utils.pagination import BasicPagination
from utils.ansible_api_bak import ANSRunner
# from Stargate.utils.ansible_api import AnsibleApi


class TaskViewSet(CommonModelViewSet):
    """
    create:
    创建任务
    list:
    获取热么列表
    retrieve:
    获取任务信息
    update:
    执行任务
    """
    # authentication_classes = []
    # permission_classes = []
    queryset = Tasks.objects.all()
    serializer_class = TasksSerializer
    pagination_class = BasicPagination
    filter_backends = (DjangoFilterBackend, SearchFilter)
    search_fields = ('name',)
    ordering_fields = ('id',)

    def partial_update(self, request, *args, **kwargs):
        pk = int(kwargs.get('pk'))
        data = request.data
        task = Tasks.objects.get(pk=pk)
        rbt = ANSRunner()
        print(task.playbook.path)
        rbt.run_playbook(task.playbook.path)
        data['detail_result'] = json.dumps(rbt.get_playbook_result(),indent=4)

        Tasks.objects.filter(pk=pk).update(**data)
        return APIResponse(status=status.HTTP_204_NO_CONTENT)

