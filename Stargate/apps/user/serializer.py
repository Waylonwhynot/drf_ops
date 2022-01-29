# -*- coding: utf-8 -*-

from Stargate.utils.views import TreeSerializer
from .models import UserProfile, Permission, Role, Organization
from rest_framework import serializers


class CommonModelSerializer(serializers.ModelSerializer):
    create_time = serializers.DateTimeField(format='%Y-%m-%d %H:%M', required=False, read_only=True)
    update_time = serializers.DateTimeField(format='%Y-%m-%d %H:%M', required=False, read_only=True)


class OrgSerializer(CommonModelSerializer):
    class Meta:
        model = Organization
        fields = '__all__'


class OrgTreeSerializer(TreeSerializer):
    class Meta:
        model = Organization
        fields = '__all__'


class UserSerializer(CommonModelSerializer):
    department_name = serializers.CharField(source='department.name', read_only=True)
    is_superuser = serializers.BooleanField(read_only=True)
    roles_name = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = UserProfile
        fields = '__all__'

    def get_roles_name(self, instance):
        roles = instance.roles.all()
        roles_list = []
        for role in roles:
            roles_list.append(role.name)
        return roles_list


class UsersPartialSerializer(serializers.ModelSerializer):
    """
    用户局部更新(激活/锁定)序列化器
    """

    class Meta:
        model = UserProfile
        fields = ['id', 'is_active']


class RoleSerializer(CommonModelSerializer):
    class Meta:
        model = Role
        fields = '__all__'


class PermissionSerializer(CommonModelSerializer):
    class Meta:
        model = Permission
        fields = '__all__'

    def validate(self, attrs):
        if attrs.get('menu') is True:
            if attrs.get('method', '') != '' or attrs.get('path', '') != '':
                raise serializers.ValidationError('菜单权限, 方法与路径必须为空')
        else:
            if attrs.get('method', '') == '' or attrs.get('path', '') == '':
                raise serializers.ValidationError('接口权限, 方法与路径为必传参数')
            path = str(attrs.get('path'))
            if not all([path.startswith('/'), path.endswith('/')]):
                raise serializers.ValidationError('请求路径必须以"/"开头及结尾')
        return attrs


class PermissionsTreeSerializer(TreeSerializer):
    """
    权限数据序列化器(Element Tree)
    """

    class Meta:
        model = Permission
        fields = '__all__'
