# -*- coding: utf-8 -*-


import requests
import json
from django_redis import get_redis_connection
from msg.models import WxMsgLogs


class WeChatApp(object):
    """
    params: corpid， corpsecret, agentid
    """

    def __init__(self, corpid, corpsecret, agentid, *args, **kwargs):
        self.CORP_ID = corpid
        self.CORP_SECRET = corpsecret
        self.AGENT_ID = agentid
        self.conn = get_redis_connection('wechat_app_info')
        self.get_access_token_url = 'https://qyapi.weixin.qq.com/cgi-bin/gettoken'
        self.get_partyid_url = 'https://qyapi.weixin.qq.com/cgi-bin/agent/get'
        self.get_users_url = 'https://qyapi.weixin.qq.com/cgi-bin/user/simplelist'
        self.send_msg_url = 'https://qyapi.weixin.qq.com/cgi-bin/message/send'

    # 获取access_token
    def _get_access_token(self):
        url = self.get_access_token_url
        values = json.dumps({
            'corpid': self.CORP_ID,
            'corpsecret': self.CORP_SECRET
        })
        req = requests.post(url, data=values)
        data = json.loads(req.text)
        return data

    # 获取组织详情
    def _get_partyid(self):
        url = self.get_partyid_url
        values = {
            'access_token': self.get_access_token,
            'agentid': self.AGENT_ID
        }
        req = requests.get(url, params=values)
        data = json.loads(req.text)
        return data

    # 获取用户
    def _get_users(self):
        url = self.get_users_url
        values = {
            'access_token': self.get_access_token,
            'department_id': self.get_partyid,
            'fetch_child': 1
        }
        req = requests.get(url, params=values)
        data = json.loads(req.text)
        return data

    # 存储token到redis; 返回token
    @property
    def get_access_token(self):
        # conn = get_redis_connection('wechat_app_info')
        # 从redis中获取, 没有就存储
        if not self.conn.exists('wechat_access_token'):
            data = self._get_access_token()
            if data['errcode'] == 0:
                access_token = data['access_token']
                expires_in = data['expires_in']
            else:
                return data
            self.conn.set('wechat_access_token', access_token, ex=expires_in)
            return access_token
        else:
            return str(self.conn.get('wechat_access_token'), encoding='utf-8')

    @property
    def get_partyid(self):
        data = self._get_partyid()
        if data['errcode'] == 0:
            return data['allow_partys']['partyid'][0]
        else:
            return data

    @property
    def get_users(self):
        return self._get_users()

    def send_msg(self, username, msg, msgtype, *args, **kwargs):
        url = self.send_msg_url + '?access_token=%s' % (self.get_access_token)
        headers = {'Content-Type': 'application/json'}
        values = {
            "touser": username,
            "msgtype": msgtype,
            "agentid": self.AGENT_ID,
            msgtype: {
                "content": msg
            },
            "safe": 0,
            "enable_id_trans": 0,
            "enable_duplicate_check": 0
        }
        req = requests.post(url, data=json.dumps(values), headers=headers)
        data = json.loads(req.text)
        return data


# def write_msg_logs(request, response):
#     """
#     记录发送微信应用消息日志
#     :param response: 企业微信API返回
#     :param request: 用户请求信息
#     :return:
#     """
#     data = {
#         'appid': '',
#         'msg_type': request.data.get('msgtype'),
#         'msg': request.data.get('msg'),
#         'status': '',
#         'detail': response.get('errmsg')
#     }
#     WxMsgLogs.objects.create(**data)
