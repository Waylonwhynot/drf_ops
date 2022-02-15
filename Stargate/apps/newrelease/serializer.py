# -*- coding: utf-8 -*-
from rest_framework import serializers
from .models import ReleaseApp


class ReleaseModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = ReleaseApp
        fields = '__all__'
