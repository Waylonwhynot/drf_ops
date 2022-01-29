import json

from django.shortcuts import render

# Create your views here.
from django_filters import OrderingFilter
from rest_framework import status
from rest_framework.filters import SearchFilter
from rest_framework.response import Response
from rest_framework.views import APIView

from Stargate.utils.pagination import BasicPagination
from Stargate.utils.response import APIResponse
from Stargate.common.wechat import WeChatApp
from django.conf import settings
from Stargate.utils.views import CommonModelViewSet, CommonReadOnlyModelViewSet
from msg import models
from Stargate.utils.logging import get_logger

from msg.serializer import AppidSerializer, WxMsgSerializer

logger = get_logger('error')


# 申请appid
class AppIDView(CommonModelViewSet):
    authentication_classes = []
    permission_classes = []

    queryset = models.AppID.objects.all()
    serializer_class = AppidSerializer
    pagination_class = BasicPagination
    filter_backends = [SearchFilter]
    search_fields = ['appname']


# 消息日志查询接口
class WxMsgLogsView(CommonReadOnlyModelViewSet):
    authentication_classes = []
    permission_classes = []

    queryset = models.WxMsgLogs.objects.all()
    serializer_class = WxMsgSerializer
    pagination_class = BasicPagination
    filter_backends = [SearchFilter]
    search_fields = ['appid__appid']


# 发送微信消息
class SendMsg(APIView):
    """
    :param 发送消息标识 appid
    :param msgtype 消息类型
    :param msg 消息内容, 格式参考企业微信要求格式
    :param users 接收人列表  ['xxx', 'aaa']
    :param appid 应用id
    """
    authentication_classes = []
    permission_classes = []

    wechat = WeChatApp(corpid=settings.CORPID, corpsecret=settings.CORPSECRET,
                       agentid=settings.AGENTID)
    # 获取人员名单
    wx_response_data = wechat.get_users

    def post(self, request, *args, **kwargs):
        # 请求体中携带参数
        msgtype = request.data.get('msgtype')
        msg = request.data.get('msg')
        appid = request.data.get('appid')
        users = request.data.get('users')
        print(msg)

        if not msgtype:
            return APIResponse(code=1, message='failed', errors='body体中须携带消息类型', status=status.HTTP_400_BAD_REQUEST)
        if not users:
            return APIResponse(code=1, message='failed', errors='body体中须携带users字段',
                               data='请求格式详情: ', status=status.HTTP_400_BAD_REQUEST)
        if not msg:
            return APIResponse(code=1, message='failed', errors='不传消息体,大佬你到底想发送啥呢？',
                               data='看下文档示例: ', status=status.HTTP_400_BAD_REQUEST)
        # 判断appid
        if appid:
            appid_obj = models.AppID.objects.filter(appid=appid).first()
            if not appid_obj:
                return APIResponse(code=1, message='failed', errors='appid不正确',
                                   data='appid查询: ', status=status.HTTP_400_BAD_REQUEST)
        else:
            return APIResponse(code=1, message='failed', errors='appid是啥?',
                               data='appid申请: ', status=status.HTTP_400_BAD_REQUEST)

        # 微信api获取人员列表成功
        if self.wx_response_data['errcode'] == 0:
            # 企业微信关联此应用的人员名单{"username": "userid"}
            wx_rep_user_list = self.wx_response_data['userlist']
            userid = ''
            success_userlist = []
            # 循环所有员工，找到对应的userid拼接
            for v in wx_rep_user_list:
                for k in users:
                    if v['name'] == k:
                        success_userlist.append(k)
                        userid += v['userid'] + '|'  # 用于多个成员的拼接
            print(userid)
            # 不正确的人员名单
            error_userlist = list(set(users) - set(success_userlist))
            # 发送消息
            wxmsg_data_response = self.wechat.send_msg(username=userid, msg=msg, msgtype=msgtype)
            # 消息发送成功
            if wxmsg_data_response['errcode'] == 0:
                # 记录日志
                req_data = {
                    'appid': appid_obj,
                    'msg_type': msgtype,
                    'msg': msg,
                    'status': 'success',
                    'detail': {'success_userlist': success_userlist, 'error_userlist': error_userlist}
                }
                res = models.WxMsgLogs.objects.create(**req_data)
            else:
                # 记录日志
                req_data = {
                    'appid': appid_obj,
                    'msg_type': msgtype,
                    'msg': msg,
                    'status': 'failed',
                    'detail': wxmsg_data_response['errmsg']
                }
                print(req_data)
                res = models.WxMsgLogs.objects.create(**req_data)
            return APIResponse(code=wxmsg_data_response['errcode'], message=req_data['status'],
                               errors=wxmsg_data_response['errmsg'],
                               data={'success_userlist': success_userlist, 'error_userlist': error_userlist})
        else:
            # 微信应用获取人员名单失败
            logger.error(self.wx_response_data)
            return Response(self.wx_response_data)
