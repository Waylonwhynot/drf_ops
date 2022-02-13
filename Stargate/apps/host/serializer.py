# -*- coding: utf-8 -*-

from rest_framework import serializers

from utils.check_host import valid_ssh
from utils.handle_key import AppSetting
from utils.ssh import SSH
from . import models

class HostModelSerializer(serializers.ModelSerializer):
    category_name = serializers.CharField(source='category.name', read_only=True)
    password = serializers.CharField(write_only=True)
    class Meta:
        model = models.Host
        fields = ['id', 'category', 'password', 'category_name', 'hostname', 'ip_addr', 'port', 'username', 'desc']

    extra_kwargs = {
        'category': {'write_only': True}
    }

    def validate(self, attrs):
        ip_addr = attrs.get('ip_addr')
        port = attrs.get('port')
        username = attrs.get('username')
        password = attrs.get('password')
        # 校验
        ret = valid_ssh(ip_addr, port, username, password)
        if not ret:
            raise serializers.ValidationError('参数校验失败, 请检查输入的内容')
        return attrs

    def create(self, validated_data):
        # 数据保存
        print('>>>', validated_data)
        ip_addr = validated_data.get('ip_addr')
        port = validated_data.get('port')
        username = validated_data.get('username')
        password = validated_data.get('password')

        # 创建公私钥之前，先检查以前是否已经创建过公私钥
        _cli = SSH(ip_addr, port, username, password=str(password))
        try:
            private_key = AppSetting.get('private_key')
            public_key = AppSetting.get('public_key')
        except KeyError:
            private_key, public_key = _cli.generate_key()
            # 如果之前没创建过，那么就创建公钥私钥
            AppSetting.set('private_key', private_key, 'ssh private key')
            AppSetting.set('public_key', public_key, 'ssh private key')
        # 将公钥私钥正传到服务器上保存
        _cli.add_public_key(public_key)
        # # 剔除密码字段，保存host记录
        password = validated_data.pop('password')
        new_host_obj = models.Host.objects.create(
            **validated_data
        )
        return new_host_obj

