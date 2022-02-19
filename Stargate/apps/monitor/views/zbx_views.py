# -*- coding: utf-8 -*-

import datetime

from django.db.models import Q, Count

# Create your views here.
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import status
from rest_framework.filters import SearchFilter
from rest_framework.mixins import ListModelMixin, CreateModelMixin
from rest_framework.views import APIView
from rest_framework.viewsets import GenericViewSet

from Stargate.utils.logging import get_logger
from Stargate.utils.pagination import BasicPagination
from Stargate.utils.response import APIResponse
from Stargate.utils.views import CommonModelViewSet, CommonReadOnlyModelViewSet
from .. import models
from ..filter.alert import AlertCenterFilter
from ..serializer import AlertSerializer, ZbxAlertSerializer

from ..settings import users
from celery_task.send_alert_task import send_alert_msg

error_logger = get_logger('error')


# class ApiAlertViews(APIView):
#     """
#     1.zabbix告警更新至数据库
#     2.告警消息异步发送
#     """
#     authentication_classes = []
#     permission_classes = []
#
#     def post(self, request, *args, **kwargs):
#         appid = request.data.get('appid')
#         eventType = request.data.get('eventType')
#         env = request.data.get('env')
#         eventMessage = request.data.get('message')
#         ret_data = eval(request.data.get('data'))
#         eventID = ret_data.get('EventID')
#         eventName = ret_data.get('Trigger')
#         eventLevel = ret_data.get('Level')
#         TriggerID = ret_data.get('TriggerID')
#         hostname = ret_data.get('Host')
#         IP = ret_data.get("IP")
#         Time = str(ret_data.get('Time')).replace(".", "-")
#
#         # 如果没有appid,就用一个默认的,用作记录消息日志
#         if not appid:
#             appid = '67FPNBXD'
#
#         if ret_data.get('Status') == "OK":
#             status = "recovery"
#         else:
#             status = "alert"
#
#         # CMDB 查询主机信息，后续填补，通过hostname 查询 部门 owner信息等
#         #########################
#         # 写入数据
#         input_data = {"TriggerID": TriggerID, "env": env, "eventName": eventName, "eventMessage": eventMessage,
#                       "hostname": hostname, "eventLevel": eventLevel, "eventType": eventType, "status": status}
#         try:
#             if status == "recovery":
#                 # 判断是否有告警数据
#                 alert_obj = models.AlertCenter.objects.filter(
#                     Q(TriggerID=TriggerID) & Q(env=env) & Q(status='alert')).first()
#                 if alert_obj:
#                     # 计算故障时长
#                     start_time = alert_obj.startTime
#                     recovery_time = datetime.datetime.strptime(Time, "%Y-%m-%d %H:%M:%S")
#                     alert_time = (recovery_time - start_time).seconds
#                     models.AlertCenter.objects.filter(pk=alert_obj.pk).update(status=status, eventMessage=eventMessage,
#                                                                               alertTime=int(alert_time),
#                                                                               recoveryTime=Time)
#                     # 发送恢复告警
#                     recovery_msg = "【故障恢复】%s: %s\n告警主机：%s\n主机 IP：%s\n告警时间：%s\n恢复时间：%s\n持续时间：%s\n告警状态: %s\n事件ID:  %s" % (
#                         hostname, eventName, hostname, IP, start_time, recovery_time, alert_time, eventMessage, eventID)
#                     send_data = {
#                         'appid': appid,
#                         'users': users.zbx_users,
#                         'msg': recovery_msg,
#                         'msgtype': 'text'
#                     }
#                     send_alert_msg.delay(**send_data)
#                     return APIResponse(message='告警恢复信息已发送')
#                 else:
#                     input_data['eventID'] = eventID
#                     input_data['recoveryTime'] = Time
#                     models.AlertCenter.objects.create(**input_data)
#
#             else:
#                 # 告警类型分类
#                 """
#                 ('cpu', 'CPU'),('mem', 'MEM'),('disk', '硬盘'),('tcp', '连接数'),('netflow', '带宽'),('unknown', '未分类'),
#                 ('unreachable', '无法连接'),('DB', 'DB')
#                 """
#                 if "CPU" in str(eventMessage) or "cpu" in str(eventMessage):
#                     alert_type = "cpu"
#                 elif "memory" in str(eventMessage):
#                     alert_type = "mem"
#                 elif "vfs.fs" in str(eventMessage) or "disk" in str(eventMessage):
#                     alert_type = "disk"
#                 elif "tcp" in str(eventMessage) or "tcp_connect" in str(eventMessage):
#                     alert_type = "tcp"
#                 elif "network" in str(eventMessage) or "net.if" in str(eventMessage) or "eth" in str(
#                         eventMessage) or "MultiGE" in str(eventMessage):
#                     alert_type = "netflow"
#                 elif "agent.ping" in str(eventMessage) or "icmpping" in str(eventMessage):
#                     alert_type = "unreachable"
#                 elif "DB" in str(eventMessage) or "Oracle" in str(eventMessage):
#                     alert_type = "DB"
#                 else:
#                     alert_type = "unknown"
#
#                 input_data['eventID'] = eventID
#                 input_data['startTime'] = Time
#                 input_data['alert_type'] = alert_type
#                 # 写入数据库,记录告警数据
#                 models.AlertCenter.objects.create(**input_data)
#                 # 发送告警
#                 alert_msg = "【故障产生】%s: %s\n告警主机：%s\n主机 IP：%s\n告警时间：%s\n告警等级：%s\n告警信息：%s\n告警状态: %s\n事件ID:  %s" % (
#                     hostname, eventName, hostname, IP, Time, eventLevel, eventName, eventMessage, eventID)
#                 send_data = {
#                     'appid': appid,
#                     'users': users.zbx_users,
#                     'msg': alert_msg,
#                     'msgtype': 'text'
#                 }
#                 try:
#                     send_alert_msg.delay(**send_data)
#                     return APIResponse(message='告警信息已发送')
#                 except Exception as e:
#                     error_logger.error(str(e))
#                     return APIResponse(code=1, message='failed', errors=str(e))
#             return APIResponse(status=HTTP_201_CREATED)
#         except Exception as e:
#             error_logger.error(str(e))
#             return APIResponse(code=1, message='failed', errors=str(e))


class ZbxApiAlertViews(ListModelMixin, CreateModelMixin, GenericViewSet):
    """
    1.Zabbix告警更新至数据库
    2.告警消息异步发送
    3.数据展示
    """
    authentication_classes = []
    permission_classes = []
    serializer_class = ZbxAlertSerializer
    queryset = models.AlertCenter.objects.all().order_by('-id')
    pagination_class = BasicPagination
    filter_backends = [SearchFilter, DjangoFilterBackend]
    filter_class = AlertCenterFilter
    search_fields = ['hostname']

    def create(self, request, *args, **kwargs):
        request_data = request.data
        serializer = self.get_serializer(data=request_data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        return APIResponse(code=200, message='success', status=status.HTTP_201_CREATED)

    def list(self, request, *args, **kwargs):
        res = super(ZbxApiAlertViews, self).list(request)
        return APIResponse(data=res.data)


class AlertListViewSet(CommonReadOnlyModelViewSet):
    """
    告警统计List
    """
    authentication_classes = []
    permission_classes = []

    queryset = models.AlertCenter.objects.all().order_by('-id')
    serializer_class = AlertSerializer
    pagination_class = BasicPagination
    filter_backends = [SearchFilter, DjangoFilterBackend]
    filter_class = AlertCenterFilter
    search_fields = ['hostname']
    # filter_fields = ('alert_type', 'status', 'env')


class AlertDashboardDayView(APIView):
    """
    告警今日统计
    """
    authentication_classes = []
    permission_classes = []

    def get(self, request, *args, **kwargs):
        """
        :param request:
        :param args:
        :param kwargs:
        :return: 告警中;已恢复;根据告警主机统计个数top5
        """
        # 当日告警信息统计
        # 开始时间: today_s   结束时间: today_e
        today_s = datetime.datetime.now().strftime('%Y-%m-%d 00:00:00')
        today_e = datetime.datetime.now().strftime('%Y-%m-%d 23:59:59')
        today_alert = models.AlertCenter.objects.filter(
            Q(startTime__range=(today_s, today_e)) & Q(status='alert')).count()
        today_recovery = models.AlertCenter.objects.filter(
            Q(startTime__range=(today_s, today_e)) & Q(status='recovery')).count()
        today_host_count = models.AlertCenter.objects.filter(startTime__range=[today_s, today_e]).values(
            'hostname').annotate(alert_count=Count('hostname')).order_by('-alert_count')[:5]

        return APIResponse(
            data={'today_alert': today_alert, 'today_recovery': today_recovery, 'today_host_count': today_host_count})


class AlertDashboardMonthView(APIView):
    """
    告警本月统计(每周展示)
    """
    authentication_classes = []
    permission_classes = []

    def get(self, request, *args, **kwargs):
        now = datetime.datetime.now()
        weekmsg = now.isocalendar()[1]
        last_year = now.isocalendar()[0] - 1
        # 如果weekmsg 是1,2,3,4, 证明是新的一年的第1周,第2周,第3周
        if weekmsg == 1:
            date_data = [str(last_year) + '年' + '.' + 'last 3周', str(last_year) + '年' + '.' + 'last 2周',
                         str(last_year) + '年' + '.' + 'last 1周',
                         str(last_year + 1) + '.' + str(weekmsg) + '周']
        elif weekmsg == 2:
            date_data = [str(last_year) + '年' + '.' + '倒数第2周', str(last_year) + '年' + '.' + '倒数第1周',
                         str(last_year + 1) + '.' + str(weekmsg - 1) + '周',
                         str(last_year + 1) + '.' + str(weekmsg) + '周']
        elif weekmsg == 3:
            date_data = [str(last_year) + '年' + '.' + '倒数第1周',
                         str(last_year + 1) + '.' + str(weekmsg - 2) + '周',
                         str(last_year + 1) + '.' + str(weekmsg - 1) + '周',
                         str(last_year + 1) + '.' + str(weekmsg) + '周']
        else:
            date_data = [str(weekmsg - 3) + '周', str(weekmsg - 2) + '周', str(weekmsg - 1) + '周', str(weekmsg) + '周']

        # 本周第一天和最后一天
        # 时间偏移量:一周已经过了几天
        delta = datetime.timedelta(days=now.weekday()).days
        this_week_s = (now - datetime.timedelta(days=now.weekday())).strftime('%Y-%m-%d 00:00:00')
        this_week_e = (now + datetime.timedelta(days=now.weekday())).strftime('%Y-%m-%d 23:59:59')

        # 前推一周
        this_week_last_1_s = (now - datetime.timedelta(days=delta + 7)).strftime('%Y-%m-%d 00:00:00')
        this_week_last_1_e = (now - datetime.timedelta(days=delta + 1)).strftime('%Y-%m-%d 23:59:59')
        # 前推二周
        this_week_last_2_s = (now - datetime.timedelta(days=delta + 14)).strftime('%Y-%m-%d 00:00:00')
        this_week_last_2_e = (now - datetime.timedelta(days=delta + 7)).strftime('%Y-%m-%d 23:59:59')
        # 前推三周
        this_week_last_3_s = (now - datetime.timedelta(days=delta + 21)).strftime('%Y-%m-%d 00:00:00')
        this_week_last_3_e = (now - datetime.timedelta(days=delta + 14)).strftime('%Y-%m-%d 23:59:59')
        # 获取监控数据
        count_data = [
            models.AlertCenter.objects.filter(startTime__range=(this_week_last_3_s, this_week_last_3_e)).count(),
            models.AlertCenter.objects.filter(startTime__range=(this_week_last_2_s, this_week_last_2_e)).count(),
            models.AlertCenter.objects.filter(startTime__range=(this_week_last_1_s, this_week_last_1_e)).count(),
            models.AlertCenter.objects.filter(startTime__range=(this_week_s, this_week_e)).count()]
        return APIResponse(data={'date_data': date_data, 'monitor_data': count_data})


class AlertDashboardWeekView(APIView):
    authentication_classes = []
    permission_classes = []
    """
    告警每天(一周)
    """

    def get(self, request, *args, **kwargs):
        # charts X轴数据
        now = datetime.datetime.now()
        date_data = [(now - datetime.timedelta(days=6)).strftime('%Y-%m-%d'),
                     (now - datetime.timedelta(days=5)).strftime('%Y-%m-%d'),
                     (now - datetime.timedelta(days=4)).strftime('%Y-%m-%d'),
                     (now - datetime.timedelta(days=3)).strftime('%Y-%m-%d'),
                     (now - datetime.timedelta(days=2)).strftime('%Y-%m-%d'),
                     (now - datetime.timedelta(days=1)).strftime('%Y-%m-%d'),
                     now.date().strftime('%Y-%m-%d')
                     ]

        # 一周时间
        this_week_today_s = (now.strftime('%Y-%m-%d 00:00:00'))
        this_week_today_e = (now.strftime('%Y-%m-%d 23:59:59'))
        this_week_last1_s = (now - datetime.timedelta(days=1)).strftime('%Y-%m-%d 00:00:00')
        this_week_last1_e = (now - datetime.timedelta(days=1)).strftime('%Y-%m-%d 23:59:59')
        this_week_last2_s = (now - datetime.timedelta(days=2)).strftime('%Y-%m-%d 00:00:00')
        this_week_last2_e = (now - datetime.timedelta(days=2)).strftime('%Y-%m-%d 23:59:59')
        this_week_last3_s = (now - datetime.timedelta(days=3)).strftime('%Y-%m-%d 00:00:00')
        this_week_last3_e = (now - datetime.timedelta(days=3)).strftime('%Y-%m-%d 23:59:59')
        this_week_last4_s = (now - datetime.timedelta(days=4)).strftime('%Y-%m-%d 00:00:00')
        this_week_last4_e = (now - datetime.timedelta(days=4)).strftime('%Y-%m-%d 23:59:59')
        this_week_last5_s = (now - datetime.timedelta(days=5)).strftime('%Y-%m-%d 00:00:00')
        this_week_last5_e = (now - datetime.timedelta(days=5)).strftime('%Y-%m-%d 23:59:59')
        this_week_last6_s = (now - datetime.timedelta(days=6)).strftime('%Y-%m-%d 00:00:00')
        this_week_last6_e = (now - datetime.timedelta(days=6)).strftime('%Y-%m-%d 23:59:59')

        # 按时间查询每天告警数
        this_week_today_count = models.AlertCenter.objects.filter(
            startTime__range=(this_week_today_s, this_week_today_e)).count()
        this_week_last1_count = models.AlertCenter.objects.filter(
            startTime__range=(this_week_last1_s, this_week_last1_e)).count()
        this_week_last2_count = models.AlertCenter.objects.filter(
            startTime__range=(this_week_last2_s, this_week_last2_e)).count()
        this_week_last3_count = models.AlertCenter.objects.filter(
            startTime__range=(this_week_last3_s, this_week_last3_e)).count()
        this_week_last4_count = models.AlertCenter.objects.filter(
            startTime__range=(this_week_last4_s, this_week_last4_e)).count()
        this_week_last5_count = models.AlertCenter.objects.filter(
            startTime__range=(this_week_last5_s, this_week_last5_e)).count()
        this_week_last6_count = models.AlertCenter.objects.filter(
            startTime__range=(this_week_last6_s, this_week_last6_e)).count()

        count_data = [this_week_last6_count, this_week_last5_count, this_week_last4_count,
                      this_week_last3_count, this_week_last2_count, this_week_last1_count,
                      this_week_today_count]
        # 返回数据
        return APIResponse(data={'date_data': date_data, 'count_data': count_data})


class AlertTypeWeekView(APIView):
    authentication_classes = []
    permission_classes = []
    """
    告警按类型统计(每周展示)
    """

    def get(self, request, *args, **kwargs):
        # charts Y轴数据
        now = datetime.datetime.now()
        date_data = [now.date().strftime('%Y-%m-%d'),
                     (now - datetime.timedelta(days=1)).strftime('%Y-%m-%d'),
                     (now - datetime.timedelta(days=2)).strftime('%Y-%m-%d'),
                     (now - datetime.timedelta(days=3)).strftime('%Y-%m-%d'),
                     (now - datetime.timedelta(days=4)).strftime('%Y-%m-%d'),
                     (now - datetime.timedelta(days=5)).strftime('%Y-%m-%d'),
                     (now - datetime.timedelta(days=6)).strftime('%Y-%m-%d')]

        # 一周时间
        this_week_today_s = (now.strftime('%Y-%m-%d 00:00:00'))
        this_week_today_e = (now.strftime('%Y-%m-%d 23:59:59'))
        this_week_last1_s = (now - datetime.timedelta(days=1)).strftime('%Y-%m-%d 00:00:00')
        this_week_last1_e = (now - datetime.timedelta(days=1)).strftime('%Y-%m-%d 23:59:59')
        this_week_last2_s = (now - datetime.timedelta(days=2)).strftime('%Y-%m-%d 00:00:00')
        this_week_last2_e = (now - datetime.timedelta(days=2)).strftime('%Y-%m-%d 23:59:59')
        this_week_last3_s = (now - datetime.timedelta(days=3)).strftime('%Y-%m-%d 00:00:00')
        this_week_last3_e = (now - datetime.timedelta(days=3)).strftime('%Y-%m-%d 23:59:59')
        this_week_last4_s = (now - datetime.timedelta(days=4)).strftime('%Y-%m-%d 00:00:00')
        this_week_last4_e = (now - datetime.timedelta(days=4)).strftime('%Y-%m-%d 23:59:59')
        this_week_last5_s = (now - datetime.timedelta(days=5)).strftime('%Y-%m-%d 00:00:00')
        this_week_last5_e = (now - datetime.timedelta(days=5)).strftime('%Y-%m-%d 23:59:59')
        this_week_last6_s = (now - datetime.timedelta(days=6)).strftime('%Y-%m-%d 00:00:00')
        this_week_last6_e = (now - datetime.timedelta(days=6)).strftime('%Y-%m-%d 23:59:59')

        # 按时间查询每个分类的数据
        # 带宽
        netflow = [
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_today_s, this_week_today_e)) & Q(alert_type='netflow')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last1_s, this_week_last1_e)) & Q(alert_type='netflow')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last2_s, this_week_last2_e)) & Q(alert_type='netflow')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last3_s, this_week_last3_e)) & Q(alert_type='netflow')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last4_s, this_week_last4_e)) & Q(alert_type='netflow')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last5_s, this_week_last5_e)) & Q(alert_type='netflow')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last6_s, this_week_last6_e)) & Q(alert_type='netflow')).count(),
        ]
        # 宕机
        unreachable = [
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_today_s, this_week_today_e)) & Q(alert_type='unreachable')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last1_s, this_week_last1_e)) & Q(alert_type='unreachable')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last2_s, this_week_last2_e)) & Q(alert_type='unreachable')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last3_s, this_week_last3_e)) & Q(alert_type='unreachable')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last4_s, this_week_last4_e)) & Q(alert_type='unreachable')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last5_s, this_week_last5_e)) & Q(alert_type='unreachable')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last6_s, this_week_last6_e)) & Q(alert_type='unreachable')).count(),
        ]
        # 内存
        mem = [
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_today_s, this_week_today_e)) & Q(alert_type='mem')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last1_s, this_week_last1_e)) & Q(alert_type='mem')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last2_s, this_week_last2_e)) & Q(alert_type='mem')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last3_s, this_week_last3_e)) & Q(alert_type='mem')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last4_s, this_week_last4_e)) & Q(alert_type='mem')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last5_s, this_week_last5_e)) & Q(alert_type='mem')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last6_s, this_week_last6_e)) & Q(alert_type='mem')).count(),
        ]
        # cpu
        cpu = [
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_today_s, this_week_today_e)) & Q(alert_type='cpu')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last1_s, this_week_last1_e)) & Q(alert_type='cpu')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last2_s, this_week_last2_e)) & Q(alert_type='cpu')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last3_s, this_week_last3_e)) & Q(alert_type='cpu')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last4_s, this_week_last4_e)) & Q(alert_type='cpu')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last5_s, this_week_last5_e)) & Q(alert_type='cpu')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last6_s, this_week_last6_e)) & Q(alert_type='cpu')).count(),
        ]
        # 硬盘
        disk = [
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_today_s, this_week_today_e)) & Q(alert_type='disk')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last1_s, this_week_last1_e)) & Q(alert_type='disk')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last2_s, this_week_last2_e)) & Q(alert_type='disk')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last3_s, this_week_last3_e)) & Q(alert_type='disk')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last4_s, this_week_last4_e)) & Q(alert_type='disk')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last5_s, this_week_last5_e)) & Q(alert_type='disk')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last6_s, this_week_last6_e)) & Q(alert_type='disk')).count(),
        ]
        # 连接数
        tcp = [
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_today_s, this_week_today_e)) & Q(alert_type='tcp')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last1_s, this_week_last1_e)) & Q(alert_type='tcp')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last2_s, this_week_last2_e)) & Q(alert_type='tcp')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last3_s, this_week_last3_e)) & Q(alert_type='tcp')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last4_s, this_week_last4_e)) & Q(alert_type='tcp')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last5_s, this_week_last5_e)) & Q(alert_type='tcp')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last6_s, this_week_last6_e)) & Q(alert_type='tcp')).count(),
        ]
        # 未分类
        unknown = [
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_today_s, this_week_today_e)) & Q(alert_type='unknown')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last1_s, this_week_last1_e)) & Q(alert_type='unknown')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last2_s, this_week_last2_e)) & Q(alert_type='unknown')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last3_s, this_week_last3_e)) & Q(alert_type='unknown')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last4_s, this_week_last4_e)) & Q(alert_type='unknown')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last5_s, this_week_last5_e)) & Q(alert_type='unknown')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last6_s, this_week_last6_e)) & Q(alert_type='unknown')).count(),
        ]
        # 数据库
        db = [
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_today_s, this_week_today_e)) & Q(alert_type='db')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last1_s, this_week_last1_e)) & Q(alert_type='db')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last2_s, this_week_last2_e)) & Q(alert_type='db')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last3_s, this_week_last3_e)) & Q(alert_type='db')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last4_s, this_week_last4_e)) & Q(alert_type='db')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last5_s, this_week_last5_e)) & Q(alert_type='db')).count(),
            models.AlertCenter.objects.filter(
                Q(startTime__range=(this_week_last6_s, this_week_last6_e)) & Q(alert_type='db')).count(),
        ]
        count_data = {'netflow': netflow, 'unreachable': unreachable, 'mem': mem, 'cpu': cpu, 'disk': disk, 'tcp': tcp,
                      'db': db, 'unknown': unknown}
        # 返回数据
        return APIResponse(data={'date_data': date_data, 'count_data': count_data})


class AlertTypeView(APIView):
    """
    告警类型
    """
    authentication_classes = []
    permission_classes = []
    choice = models.AlertCenter.alert_types

    def get(self, request):
        alert_type = [{'value': value[0], 'label': value[1]} for value in self.get_choice()]
        return APIResponse(data={'results': alert_type})

    def get_choice(self):
        assert self.choice is not None, (
                "'%s' 应该包含一个`choice`属性，或覆盖`get_choice()`方法"
                % self.__class__.__name__
        )
        assert isinstance(self.choice, tuple) and len(self.choice) > 0, 'choice数据错误, 应为二元组'
        for values in self.choice:
            assert isinstance(values, tuple) and len(values) == 2, 'choice数据错误, 应该为二维数组'
        return self.choice


class AlertStatusView(APIView):
    """
    告警状态
    """
    authentication_classes = []
    permission_classes = []
    choice = models.AlertCenter.status_type

    def get(self, request):
        status_type = [{'value': value[0], 'label': value[1]} for value in self.get_choice()]
        return APIResponse(data={'results': status_type})

    def get_choice(self):
        assert self.choice is not None, (
                "'%s' 应该包含一个`choice`属性，或覆盖`get_choice()`方法"
                % self.__class__.__name__
        )
        assert isinstance(self.choice, tuple) and len(self.choice) > 0, 'choice数据错误, 应为二元组'
        for values in self.choice:
            assert isinstance(values, tuple) and len(values) == 2, 'choice数据错误, 应该为二维数组'
        return self.choice


class AlertEnvView(APIView):
    """
    环境列表
    """
    authentication_classes = []
    permission_classes = []
    choice = models.AlertCenter.envs

    def get(self, request):
        alert_env = [{'value': value[0], 'label': value[1]} for value in self.get_choice()]
        return APIResponse(data={'results': alert_env})

    def get_choice(self):
        assert self.choice is not None, (
                "'%s' 应该包含一个`choice`属性，或覆盖`get_choice()`方法"
                % self.__class__.__name__
        )
        assert isinstance(self.choice, tuple) and len(self.choice) > 0, 'choice数据错误, 应为二元组'
        for values in self.choice:
            assert isinstance(values, tuple) and len(values) == 2, 'choice数据错误, 应该为二维数组'
        return self.choice
