# -*- coding: utf-8 -*-
from rest_framework import serializers

from host.models import Host
from .models import CmdTemplate,CmdTemplateCategory

class HostModelSerializer(serializers.ModelSerializer):
    category_name = serializers.CharField(source='category.name', read_only=True)

    class Meta:
        model = Host
        fields = ['id', 'category', 'category_name', 'hostname', 'ip_addr', 'port', 'username', 'desc']


class TemplateModelSerialzer(serializers.ModelSerializer):
    class Meta:
        model = CmdTemplate
        fields = '__all__'

class TemplateCategoryModelSerialzer(serializers.ModelSerializer):
    class Meta:
        model = CmdTemplateCategory
        fields = '__all__'