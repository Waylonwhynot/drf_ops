# -*- coding: utf-8 -*-

import datetime

from django.db.models import Q, Count

# Create your views here.
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import status
from rest_framework.filters import SearchFilter
from rest_framework.mixins import ListModelMixin, CreateModelMixin
from rest_framework.views import APIView
from rest_framework.viewsets import GenericViewSet

from Stargate.utils.pagination import BasicPagination
from Stargate.utils.response import APIResponse
from .. import models
from ..filter.alert import AlertCenterFilter
from ..serializer import PromAlertSerializer


# error_logger = get_logger('error')


class PromApiAlertViews(ListModelMixin, CreateModelMixin, GenericViewSet):
    """
    1.prometheus告警更新至数据库
    2.告警消息异步发送
    3.数据展示
    """
    authentication_classes = []
    permission_classes = []
    serializer_class = PromAlertSerializer
    queryset = models.PromAlertCenter.objects.all()
    pagination_class = BasicPagination

    def create(self, request, *args, **kwargs):
        request_data = request.data
        # 一条信息里面可能包含多条告警，alertmanger的特性，会将多条信息合并发出
        for output in request_data['alerts'][:]:
            serializer = self.get_serializer(data=output)
            serializer.is_valid(raise_exception=True)
            self.perform_create(serializer)
        return APIResponse(code=200, message='success', status=status.HTTP_201_CREATED)

    def list(self, request, *args, **kwargs):
        res = super(PromApiAlertViews, self).list(request)
        return APIResponse(data=res.data)


class PromAlertTypeView(APIView):
    """
    告警类型
    """
    authentication_classes = []
    permission_classes = []
    choice = models.PromAlertCenter.alert_types

    def get(self, request):
        alert_type = [{'value': value[0], 'label': value[1]} for value in self.get_choice()]
        return APIResponse(data={'results': alert_type})

    def get_choice(self):
        assert self.choice is not None, (
                "'%s' 应该包含一个`choice`属性，或覆盖`get_choice()`方法"
                % self.__class__.__name__
        )
        assert isinstance(self.choice, tuple) and len(self.choice) > 0, 'choice数据错误, 应为二元组'
        for values in self.choice:
            assert isinstance(values, tuple) and len(values) == 2, 'choice数据错误, 应该为二维数组'
        return self.choice


class PromAlertStatusView(APIView):
    """
    告警状态
    """
    authentication_classes = []
    permission_classes = []
    choice = models.PromAlertCenter.status_type

    def get(self, request):
        status_type = [{'value': value[0], 'label': value[1]} for value in self.get_choice()]
        return APIResponse(data={'results': status_type})

    def get_choice(self):
        assert self.choice is not None, (
                "'%s' 应该包含一个`choice`属性，或覆盖`get_choice()`方法"
                % self.__class__.__name__
        )
        assert isinstance(self.choice, tuple) and len(self.choice) > 0, 'choice数据错误, 应为二元组'
        for values in self.choice:
            assert isinstance(values, tuple) and len(values) == 2, 'choice数据错误, 应该为二维数组'
        return self.choice


class PromAlertEnvView(APIView):
    """
    环境列表
    """
    authentication_classes = []
    permission_classes = []
    choice = models.PromAlertCenter.envs

    def get(self, request):
        alert_env = [{'value': value[0], 'label': value[1]} for value in self.get_choice()]
        return APIResponse(data={'results': alert_env})

    def get_choice(self):
        assert self.choice is not None, (
                "'%s' 应该包含一个`choice`属性，或覆盖`get_choice()`方法"
                % self.__class__.__name__
        )
        assert isinstance(self.choice, tuple) and len(self.choice) > 0, 'choice数据错误, 应为二元组'
        for values in self.choice:
            assert isinstance(values, tuple) and len(values) == 2, 'choice数据错误, 应该为二维数组'
        return self.choice
