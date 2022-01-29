from django.shortcuts import render
from django.contrib.auth import get_user_model
# Create your views here.
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import status
from rest_framework.filters import SearchFilter

from libs.jenkins import JenkinsApi
from utils.pagination import BasicPagination
from utils.response import APIResponse
from utils.views import CommonModelViewSet
from .serializer import DeplySerializer
from .models import Deploy
from time import sleep
from django.conf import settings

User = get_user_model()


class DeployViewset(CommonModelViewSet):
    """
    create:
    申请上线
    list:
    获取上线列表
    retrieve:
    获取上线信息
    update:
    代码更新信息
    delete:
    取消上线
    """
    queryset = Deploy.objects.all().order_by('-id')
    serializer_class = DeplySerializer
    pagination_class = BasicPagination
    filter_backends = (DjangoFilterBackend, SearchFilter)
    search_fields = ('name', 'status')
    ordering = ('id',)

    def get_queryset(self):
        status = self.request.GET.get('status', None)
        print(status)
        applicant = self.request.user
        role = applicant.roles.all().values('name')
        role_name = [r['name'] for r in role]
        queryset = super(DeployViewset, self).get_queryset()
        # 判断传来的status值判断是申请列表还是历史列表
        if status and int(status) <= 2:
            queryset = queryset.filter(status__lte=2)
        elif status and int(status) > 2:
            queryset = queryset.filter(status__gte=2)
        else:
            pass

        # 判断登陆用户是否是管理员，是则显示所有工单，否则只显示自己的
        if 'admin' not in role_name:
            queryset = queryset.filter(applicant=applicant)
        return queryset

    def partial_update(self, request, *args, **kwargs):
        pk = int(kwargs.get('pk'))
        data = request.data
        print(pk, data)
        print(data['status'])
        if data['status'] == 3:
            jenkins = JenkinsApi()
            number = jenkins.get_next_build_number(data['name'])
            print('number下一次', number)
            jenkins.build_job(data['name'], parameters={'tag': data['version']}, token=settings.JENINS_TOKEN)
            sleep(10)
            console_output = jenkins.get_build_console_output(data['name'], number)
            data['console_output'] = console_output
            data['assign_to'] = request.user.id
        Deploy.objects.filter(pk=pk).update(**data)
        return APIResponse(status=status.HTTP_204_NO_CONTENT)

    def update(self, request, *args, **kwargs):
        pk = int(kwargs.get('pk'))
        data = (request.data).dict()
        print(data)
        print(data['name'])
        print(data['version'])
        jenkins = JenkinsApi()
        number = jenkins.get_next_build_number(data['name'])
        jenkins.build_job(data['name'], parameters={'tag': data['version']})
        sleep(5)
        console_output = jenkins.get_build_console_output(data['name'], number)
        data['console_output'] = console_output
        print(data)
        Deploy.objects.filter(pk=pk).update(**data)
        return APIResponse(status=status.HTTP_204_NO_CONTENT)

