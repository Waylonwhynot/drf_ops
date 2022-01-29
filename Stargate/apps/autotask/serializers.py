# -*- coding: utf-8 -*-
from rest_framework import serializers
from .models import Tasks

class TasksSerializer(serializers.ModelSerializer):
    """
    任务序列化类
    """
    add_time = serializers.DateTimeField(format='%Y-%m-%d %H:%M', required=False, read_only=True)
    exec_time = serializers.DateTimeField(format='%Y-%m-%d %H:%M', required=False, read_only=True)
    class Meta:
        model = Tasks
        fields = '__all__'

    def create(self, validated_data):
        instance = self.Meta.model.objects.create(**validated_data)
        instance.save()
        return instance
