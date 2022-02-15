# -*- coding: utf-8 -*-
from rest_framework import serializers
from .models import Environment


class EnvironmentModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Environment
        fields = '__all__'
