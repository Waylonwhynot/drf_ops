# -*- coding: utf-8 -*-

import datetime

from django.db.models import Q
from rest_framework import serializers
from rest_framework.serializers import ModelSerializer

from Stargate.utils.functions import trans_time_utc, trans_timedelta, makealertdata, makezbxalertdata
from Stargate.utils.logging import get_logger
from monitor.models import AlertCenter, PromAlertCenter
from .settings import users, appid
from celery_task.send_alert_task import send_alert_msg

info_logger = get_logger('info')


class AlertSerializer(ModelSerializer):
    startTime = serializers.DateTimeField(format='%Y-%m-%d %H:%M:%S')
    recoveryTime = serializers.DateTimeField(format='%Y-%m-%d %H:%M:%S')

    class Meta:
        model = AlertCenter
        fields = '__all__'


class PromAlertSerializer(ModelSerializer):
    startTime = serializers.DateTimeField(format='%Y-%m-%d %H:%M:%S')
    recoveryTime = serializers.DateTimeField(format='%Y-%m-%d %H:%M:%S')

    class Meta:
        model = PromAlertCenter
        fields = '__all__'

    def to_internal_value(self, data):
        # 告警业务
        try:
            eventService = data['labels']['project_name']
        except KeyError:
            eventService = 'null'
        # 告警消息
        try:
            eventMessage = data['annotations']['message']
        except KeyError:
            try:
                eventMessage = data['annotations']['description']
            except KeyError:
                eventMessage = 'null'

        # 其余各个字段
        env = 'PRO'
        fingerprint = data['fingerprint']
        eventLevel = data['labels']['severity']
        hostname = data['labels']['node_name']
        alertType = data['labels']['alertname']
        status = data['status']
        if status == 'resolved':
            startTime = trans_time_utc(data['startsAt'])  # str
            recoveryTime = trans_time_utc(data['endsAt'])  # str
            alertTime = trans_timedelta((datetime.datetime.strptime(recoveryTime,
                                                                    "%Y-%m-%d %H:%M:%S") - datetime.datetime.strptime(
                startTime, "%Y-%m-%d %H:%M:%S")))
            req_data = {'fingerprint': fingerprint, 'env': env, 'eventLevel': eventLevel, 'eventService': eventService,
                        'alertType': alertType, 'hostname': hostname, 'eventMessage': eventMessage, 'status': status,
                        'startTime': startTime, 'recoveryTime': recoveryTime, 'alertTime': alertTime}
        else:
            startTime = trans_time_utc(data['startsAt'])
            req_data = {'fingerprint': fingerprint, 'env': env, 'eventLevel': eventLevel, 'eventService': eventService,
                        'alertType': alertType, 'hostname': hostname, 'eventMessage': eventMessage, 'status': status,
                        'startTime': startTime}
        return req_data

    def create_promalert(self, validated_data):
        # 创建告警；异步任务告警
        promalert_obj = PromAlertCenter.objects.create(**validated_data)
        # 拼接告警信息
        alert_msg = makealertdata(**validated_data)
        # 查询项目负责人
        # 异步任务告警
        send_data = {
            'appid': appid.prom_appid,
            'users': users.prom_users,
            'msg': alert_msg,
            'msgtype': 'markdown'
        }
        info_logger.info('异步任务告警数据', str(send_data))
        send_alert_msg.delay(**send_data)
        return promalert_obj

    def update_promalert(self, instance, validated_data):
        # 更新告警(状态,结束时间,持续时间)；异步任务恢复告警
        instance.status = validated_data['status']
        instance.recoveryTime = validated_data['recoveryTime']
        instance.alertTime = validated_data['alertTime']
        # 拼接告警信息
        recovery_msg = makealertdata(**validated_data)
        # 查询项目负责人
        # 异步任务告警
        send_data = {
            'appid': appid.prom_appid,
            'users': users.prom_users,
            'msg': recovery_msg,
            'msgtype': 'markdown'
        }
        info_logger.info('异步恢复告警数据', str(send_data))
        send_alert_msg.delay(**send_data)
        instance.save()

        return instance

    def check_project_user(self, project):
        """
        :param project: project_name 项目名
        :return: ['xxx', 'yyy'] 人员列表
        """
        pass

    def create(self, validated_data):
        fingerprint = validated_data['fingerprint']
        promalert_obj = PromAlertCenter.objects.filter(fingerprint=fingerprint).first()
        # 如果告警在数据库中存在就更新; 不存在就增加; 然后异步任务拼接告警
        if promalert_obj:
            try:
                return self.update_promalert(promalert_obj, validated_data)
            except promalert_obj.DoesNotExist:
                return self.create_promalert(validated_data)
        else:
            return self.create_promalert(validated_data)


class ZbxAlertSerializer(ModelSerializer):
    startTime = serializers.DateTimeField(format='%Y-%m-%d %H:%M:%S')
    recoveryTime = serializers.DateTimeField(format='%Y-%m-%d %H:%M:%S')

    class Meta:
        model = AlertCenter
        fields = '__all__'

    def to_internal_value(self, request_data):
        env = request_data.get('env')
        appid = request_data.get('appid')
        eventType = request_data.get('eventType')
        eventMessage = request_data.get('message')
        data_dict = eval(request_data['data'])
        eventID = data_dict.get('EventID')
        eventName = data_dict.get('Trigger')
        eventLevel = data_dict.get('Level')
        TriggerID = data_dict.get('TriggerID')
        hostname = data_dict.get('Host')
        IP = data_dict.get("IP")
        Time = str(data_dict.get('Time')).replace(".", "-")
        if data_dict.get('Status') == 'OK':
            status = "recovery"
            # 计算故障时长
            alert_obj = AlertCenter.objects.filter(Q(TriggerID=TriggerID) & Q(env=env) & Q(status='alert')).first()
            if alert_obj:
                start_time = alert_obj.startTime
                recovery_time = datetime.datetime.strptime(Time, "%Y-%m-%d %H:%M:%S")
                alert_time = trans_timedelta((recovery_time - start_time))
                req_data = {'appid': appid, 'eventID': eventID, 'IP': IP, 'startTime': start_time, 'TriggerID': TriggerID,
                            'env': env, 'eventName': eventName, 'eventMessage': eventMessage, 'hostname': hostname,
                            'eventLevel': eventLevel, 'eventType': eventType, 'status': status,
                            'recoveryTime': recovery_time, 'alertTime': alert_time}
            else:
                req_data = {'appid': appid, 'eventID': eventID, 'IP': IP, 'TriggerID': TriggerID,
                            'env': env, 'eventName': eventName, 'eventMessage': eventMessage, 'hostname': hostname,
                            'eventLevel': eventLevel, 'eventType': eventType, 'status': status,
                            'recoveryTime': Time}

        else:
            status = "alert"
            alert_type = self.check_alert_type(eventMessage)
            req_data = {'appid': appid, 'eventID': eventID, 'IP': IP, 'startTime': Time, 'TriggerID': TriggerID,
                        "env": env,
                        'alert_type': alert_type, 'eventName': eventName, 'eventMessage': eventMessage,
                        'hostname': hostname, 'eventLevel': eventLevel, 'eventType': eventType, 'status': status}
        return req_data

    def check_alert_type(self, message):
        # 告警类型分类
        """
        ('cpu', 'CPU'),('mem', 'MEM'),('disk', '硬盘'),('tcp', '连接数'),('netflow', '带宽'),('unknown', '未分类'),
        ('unreachable', '无法连接'),('DB', 'DB')
        """
        if "CPU" in str(message) or "cpu" in str(message):
            alert_type = "cpu"
            return alert_type
        elif "memory" in str(message):
            alert_type = "mem"
            return alert_type
        elif "vfs.fs" in str(message) or "disk" in str(message):
            alert_type = "disk"
            return alert_type
        elif "tcp" in str(message) or "tcp_connect" in str(message):
            alert_type = "tcp"
            return alert_type
        elif "network" in str(message) or "net.if" in str(message) or "eth" in str(
                message) or "MultiGE" in str(message):
            alert_type = "netflow"
            return alert_type
        elif "agent.ping" in str(message) or "icmpping" in str(message):
            alert_type = "unreachable"
            return alert_type
        elif "DB" in str(message) or "Oracle" in str(message):
            alert_type = "DB"
            return alert_type
        else:
            alert_type = "unknown"
            return alert_type

    def create_alert(self, validated_data):
        """
        # 1.创建告警；
        # 2.异步任务告警
        :param validated_data:
        :return: instance
        """
        # 模型未设置IP、appid字段, 先pop出去
        IP = validated_data.pop('IP')
        appid = validated_data.pop('appid')
        alert_obj = AlertCenter.objects.create(**validated_data)
        # pop告警不需要的信息
        eventType = validated_data.pop('eventType')
        TriggerID = validated_data.pop('TriggerID')
        # 拼接告警信息
        alert_msg = makezbxalertdata(IP=IP, **validated_data)
        # 查询项目负责人
        # 异步任务告警
        send_data = {
            'appid': appid,
            'users': users.zbx_users,
            'msg': alert_msg,
            'msgtype': 'text'
        }
        send_alert_msg.delay(**send_data)
        return alert_obj

    def update_alert(self, instance, validated_data):
        # pop不需要的字段
        appid = validated_data.pop('appid')
        TriggerID = validated_data.pop('TriggerID')
        eventType = validated_data.pop('eventType')
        # 更新告警(状态,结束时间,持续时间)；异步任务恢复告警
        instance.status = validated_data['status']
        instance.recoveryTime = validated_data['recoveryTime']
        instance.alertTime = validated_data['alertTime']
        # 拼接告警信息
        recovery_msg = makezbxalertdata(**validated_data)
        # 查询项目负责人
        # 异步任务告警
        send_data = {
            'appid': appid,
            'users': users.zbx_users,
            'msg': recovery_msg,
            'msgtype': 'text'
        }
        send_alert_msg.delay(**send_data)
        instance.save()

        return instance

    def create(self, validated_data):
        TriggerID = validated_data.get('TriggerID')
        env = validated_data.get('env')
        alert_obj = AlertCenter.objects.filter(Q(TriggerID=TriggerID) & Q(env=env) & Q(status='alert')).first()
        if alert_obj:
            try:
                return self.update_alert(alert_obj, validated_data)
            except alert_obj.DoesNotExist:
                return self.create_alert(validated_data)
        else:
            return self.create_alert(validated_data)
