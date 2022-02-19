# -*- coding: utf-8 -*-


from .celery import app


# 发送告警信息, 记录日志
@app.task
def send_alert_msg(appid, users, msg, msgtype):
    from Stargate.common.wechat import WeChatApp, write_msg_logs
    from django.conf import settings
    from msg.models import AppID

    appid_obj = AppID.objects.filter(appid=appid).first()
    print('appid_obj', appid_obj)
    # 实例化配置
    wechat = WeChatApp(corpid=settings.CORPID, corpsecret=settings.CORPSECRET,
                       agentid=settings.AGENTID)

    success_userlist, error_userlist, res = wechat.send_wx_msg(users=users, msg=msg, msgtype=msgtype)
    if res['errcode'] == 0:
        # 记录消息发送状态
        write_msg_logs(appid=appid_obj, msg_type=msgtype, msg=msg, status='success',
                       detail={'success_userlist': success_userlist,
                               'error_userlist': error_userlist})
    else:
        write_msg_logs(appid=appid_obj, msg_type=msgtype, msg=msg, status='failed',
                       detail={'success_userlist': success_userlist,
                               'error_userlist': error_userlist})

