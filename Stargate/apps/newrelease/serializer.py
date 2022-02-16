# -*- coding: utf-8 -*-
from rest_framework import serializers
from .models import ReleaseApp


class ReleaseModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = ReleaseApp
        fields = '__all__'

        extra_kwargs = {
            'id': {'read_only': True},
            'user': {'required': False},
            'app_id': {'required': False}
        }

    def create(self, validated_data):
        obj = ReleaseApp.objects.create(**{
            'name': validated_data.get('name'),
            'user': self.context['request'].user,
            'remark': validated_data.get('remark')
        })
        return obj