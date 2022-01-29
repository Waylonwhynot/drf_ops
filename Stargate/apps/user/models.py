# -*- coding: utf-8 -*-

from django.db import models
from django.contrib.auth.models import AbstractUser
from Stargate.utils.models import CbaseModel


# Create your models here.


class UserProfile(AbstractUser, CbaseModel):
    """
    用户扩展表
    """
    name = models.CharField(max_length=150, default="", verbose_name="姓名", blank=True, null=True)
    mobile = models.CharField(max_length=11, default="", verbose_name="手机号码", blank=True, null=True)
    email = models.EmailField(max_length=50, verbose_name="邮箱")
    # image = models.ImageField(upload_to="image/%Y/%m", default="image/default.png", max_length=100, null=True, blank=True)
    department = models.ForeignKey("Organization", null=True, blank=True, on_delete=models.SET_NULL, verbose_name="部门")
    position = models.CharField(max_length=50, null=True, blank=True, verbose_name="职位")
    superior = models.ForeignKey("self", null=True, blank=True, on_delete=models.SET_NULL, verbose_name="上级主管")
    roles = models.ManyToManyField("Role", verbose_name="角色", blank=True)

    def __str__(self):
        return self.username

    class Meta:
        verbose_name = "用户信息"
        verbose_name_plural = verbose_name
        ordering = ['id']

    def get_user_info(self):
        # 获取用户信息
        user_info = {
            'id': self.pk,
            'username': self.username,
            'name': self.name,
            # 'avatar': '/media/' + str(self.image),
            'email': self.email,
            'permissions': self._get_user_permissions(),
            'department': self.department.name if self.department else '',
            'mobile': self.mobile
        }
        return user_info

    def _get_user_permissions(self):
        # 获取用户权限
        permissions = list(filter(None, set(self.roles.values_list('permissions__sign', flat=True))))
        if 'admin' in self.roles.values_list('name', flat=True):
            permissions.append('admin')
        return permissions


class Organization(CbaseModel):
    """
    组织架构表
    """
    organization_type_choices = (
        ("company", "公司"),
        ("department", "部门")
    )
    name = models.CharField(max_length=60, unique=True, verbose_name="名称")
    type = models.CharField(max_length=20, choices=organization_type_choices, default="department", verbose_name="类型")
    pid = models.ForeignKey("self", null=True, blank=True, on_delete=models.SET_NULL, verbose_name="父类组织")

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "组织架构"
        verbose_name_plural = verbose_name
        ordering = ['id']


class Permission(CbaseModel):
    """
    权限表
    """
    method_choices = (
        (u'POST', u'增'),
        (u'DELETE', u'删'),
        (u'PUT', u'改'),
        (u'PATCH', u'局部改'),
        (u'GET', u'查')
    )
    name = models.CharField(max_length=30, unique=True, verbose_name="权限名")
    sign = models.CharField(max_length=30, verbose_name='权限标识')
    method = models.CharField(max_length=8, blank=True, default='', choices=method_choices, verbose_name='方法')
    menu = models.BooleanField(verbose_name='是否为菜单')  # True为菜单，False为接口
    path = models.CharField(max_length=200, blank=True, default='', verbose_name='请求路径正则')
    pid = models.ForeignKey('self', null=True, blank=True, on_delete=models.CASCADE, verbose_name='父权限')
    desc = models.CharField(max_length=30, null=True, default='', blank=True, verbose_name='权限描述')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '权限'
        verbose_name_plural = verbose_name
        ordering = ['-id']


class Role(CbaseModel):
    """
    角色表
    """
    name = models.CharField(max_length=32, unique=True, verbose_name="角色")
    permissions = models.ManyToManyField("Permission", blank=True, verbose_name="权限")
    desc = models.CharField(max_length=50, blank=True, null=True, verbose_name="角色描述")

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "角色"
        verbose_name_plural = verbose_name
        ordering = ['id']
