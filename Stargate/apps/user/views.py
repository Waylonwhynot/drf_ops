# -*- coding: utf-8 -*-

import json

from django.shortcuts import render

# Create your views here.
from django_redis import get_redis_connection
from rest_framework import status
from rest_framework.filters import SearchFilter, OrderingFilter
from rest_framework.views import APIView
from django.contrib.auth import authenticate
from rest_framework_jwt.serializers import jwt_payload_handler, jwt_encode_handler

from Stargate.utils.pagination import BasicPagination
from .serializer import OrgTreeSerializer, RoleSerializer, PermissionSerializer, UserSerializer, \
    PermissionsTreeSerializer, OrgSerializer, UsersPartialSerializer
from Stargate.utils.views import CommonModelViewSet, ListView, TreeAPIView
from Stargate.utils.response import APIResponse
from . import models


# 用户登录, JWT签发token
class UserAuthView(APIView):
    """
    用户认证获取token
    """
    authentication_classes = []
    permission_classes = []

    def post(self, request, *args, **kwargs):
        username = request.data.get('username')
        password = request.data.get('password')
        user = authenticate(request, username=username, password=password)
        if user:
            # 访问记录，每次访问增加1
            conn = get_redis_connection('user_info')
            conn.incr('visits')
            # 生成payload
            payload = jwt_payload_handler(user)
            # 签发token
            jwt_token = jwt_encode_handler(payload)
            return APIResponse(data={'token': jwt_token})
        else:
            return APIResponse(code=1, message='failed', errors='用户名或者密码错误', status=status.HTTP_400_BAD_REQUEST)


# 用户登出
class Logout(APIView):
    def post(self, request, *args, **kwargs):
        response = APIResponse()
        response.delete_cookie('Admin-Token')
        return response


# 获取用户信息
class UserInfoView(APIView):
    """
    获取当前用户信息和权限
    """

    def get(self, request, *args, **kwargs):
        if request.user.id is not None:
            user_info = request.user.get_user_info()
            # print('user_info', user_info)
            # 将用户信息缓存到redis
            conn = get_redis_connection('user_info')
            if request.user.is_superuser and 'admin' not in user_info['permissions']:
                user_info['permissions'].append('admin')
            user_info['permissions'] = json.dumps(user_info['permissions'])
            conn.hmset('user_info_%s' % request.user.id, user_info)
            conn.expire('user_info_%s' % request.user.id, 60 * 60 * 24)  # 过期时间1天
            user_info['permissions'] = json.loads(user_info['permissions'])
            return APIResponse(data=user_info, status=status.HTTP_200_OK)
        else:
            # print("未获取到用户信息")
            return APIResponse(code=1, message='failed', errors='请先登录')


# 用户接口
class UserView(CommonModelViewSet):
    queryset = models.UserProfile.objects.all()
    serializer_class = UserSerializer
    pagination_class = BasicPagination
    filter_backends = [SearchFilter, OrderingFilter]
    search_fields = ['username', 'email']

    def get_serializer_class(self):
        if self.action == 'partial_update':
            return UsersPartialSerializer
        else:
            return UserSerializer


# 角色接口
class RoleView(CommonModelViewSet):
    queryset = models.Role.objects.all()
    serializer_class = RoleSerializer
    pagination_class = BasicPagination
    filter_backends = [SearchFilter, OrderingFilter]
    search_fields = ['name']

    def update(self, request, *args, **kwargs):
        if self.get_object().name == 'admin':
            return APIResponse(data={'detail': 'admin角色不可修改'}, status=status.HTTP_400_BAD_REQUEST)
        return super().update(request, *args, **kwargs)

    def destroy(self, request, *args, **kwargs):
        if self.get_object().name == 'admin':
            return APIResponse(data={'detail': 'admin角色不可删除'}, status=status.HTTP_400_BAD_REQUEST)
        return super().destroy(request, *args, **kwargs)

    def partial_update(self, request, *args, **kwargs):
        if self.get_object().name == 'admin':
            return APIResponse(data={'detail': 'admin角色, 默认拥有所有权限'}, status=status.HTTP_400_BAD_REQUEST)
        print("partial_update")
        return super().partial_update(request, *args, **kwargs)


# 组织架构接口
class OrganizationView(CommonModelViewSet, TreeAPIView):
    queryset = models.Organization.objects.all()
    serializer_class = OrgSerializer
    pagination_class = BasicPagination
    filter_backends = [SearchFilter, OrderingFilter]
    search_fields = ['name']

    def get_serializer_class(self):
        if self.action == 'list':
            return OrgTreeSerializer
        else:
            return OrgSerializer


# 权限接口
class PermissionView(CommonModelViewSet, TreeAPIView):
    queryset = models.Permission.objects.all().order_by('-id')
    serializer_class = PermissionSerializer
    pagination_class = BasicPagination
    filter_backends = [SearchFilter, OrderingFilter]
    search_fields = ['name', 'path', 'desc']
    ordering_fields = ['id', 'name']

    def get_serializer_class(self):
        if self.action == 'list':
            # print('list方法')
            return PermissionsTreeSerializer
        else:
            return PermissionSerializer


class PermissionsMethodsAPIView(APIView):
    """
    权限models中的方法列表信息, code: 200(成功), return: 权限models中的方法列表
    model choice字段API, 需指定choice属性或覆盖get_choice方法
    """
    choice = models.Permission.method_choices

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
