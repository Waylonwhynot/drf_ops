
from rest_framework.serializers import ModelSerializer

from Stargate.utils.views import TreeSerializer
from .models import AppID, WxMsgLogs
from rest_framework import serializers


class CommonModelSerializer(serializers.ModelSerializer):
    create_time = serializers.DateTimeField(format='%Y-%m-%d %H:%M', required=False, read_only=True)
    update_time = serializers.DateTimeField(format='%Y-%m-%d %H:%M', required=False, read_only=True)


class AppidSerializer(CommonModelSerializer):
    class Meta:
        model = AppID
        fields = '__all__'


class WxMsgSerializer(ModelSerializer):
    msg_date = serializers.DateTimeField(format='%Y-%m-%d %H:%M', required=False, read_only=True)

    def to_representation(self, instance):
        appid_obj = instance.appid
        ret = super(WxMsgSerializer, self).to_representation(instance)
        ret['appid'] = appid_obj.appid
        return ret

    class Meta:
        model = WxMsgLogs
        fields = '__all__'
