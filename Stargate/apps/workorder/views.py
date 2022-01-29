from django.shortcuts import render

# Create your views here.
from django.contrib.auth import get_user_model
from user.models import Role
from rest_framework import viewsets, mixins, permissions, status
from rest_framework import filters
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import SearchFilter
from rest_framework.views import APIView

from Stargate.utils.pagination import BasicPagination
from .serializers import WorkOrderSerializer
from .models import WorkOrder
from Stargate.utils.views import CommonModelViewSet
from Stargate.utils.response import APIResponse

User = get_user_model()


class WorkOrderViewSet(CommonModelViewSet):
    """
    create:
    创建工单
    list:
    获取工单列表
    retrieve:
    获取工单信息
    update:
    更新工单信息
    delete:
    删除用户
    """
    # authentication_classes = []
    # permission_classes = []
    queryset = WorkOrder.objects.all()
    serializer_class = WorkOrderSerializer
    pagination_class = BasicPagination
    filter_backends = (SearchFilter,)
    search_fields = ('title')
    order_fields = ('id')

    def get_queryset(self):
        status = self.request.GET.get('status', None)
        applicant = self.request.user
        role = applicant.roles.all().values('name')
        role_name = [r['name'] for r in role]
        queryset = super(WorkOrderViewSet, self).get_queryset()

        # 判断传来的status值判断是申请列表还是历史列表
        if status and int(status) == 1:
            queryset = queryset.filter(status__lte=int(status))
        elif status and int(status) == 2:
            queryset = queryset.filter(status__gte=int(status))
        else:
            pass

        # 判断登录用户是不是管理员
        if 'admin' not in role_name:
            queryset = queryset.filter(applicant=applicant)
        return queryset

    def partial_update(self, request, *args, **kwargs):
        print('request.data', request.data)
        pk = int(kwargs.get('pk'))
        final_processor = self.request.user
        data = request.data
        data['final_processor'] = final_processor
        print(data)
        instance = WorkOrder.objects.filter(pk=pk).update(**data)
        return APIResponse(status=status.HTTP_204_NO_CONTENT)


class WorkOrderTypeAPIView(APIView):
    """
    权限models中的方法列表信息, code: 200(成功), return: 工单models中的类型列表
    """
    choice = WorkOrder.order_type

    def get(self, request):
        methods = [{'value': value[0], 'label': value[1]} for value in self.get_choice()]
        return APIResponse(data={'results': methods})

    def get_choice(self):
        assert self.choice is not None, (
                "'%s' 应该包含一个`choice`属性，或覆盖`get_choice()`方法"
                % self.__class__.__name__
        )
        assert isinstance(self.choice, tuple) and len(self.choice) > 0, 'choice数据错误, 应为二元组'
        for values in self.choice:
            assert isinstance(values, tuple) and len(values) == 2, 'choice数据错误, 应该为二维数组'
        return self.choice


class WorkOrderOps(APIView):
    opslist = Role.objects.filter(name='ops').first().userprofile_set.all()

    def get(self, request):
        ops = [{'label': value.username, 'value': value.id} for value in self.opslist]
        return APIResponse(data={'results': ops})
