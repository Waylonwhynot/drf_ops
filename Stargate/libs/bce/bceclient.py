# -*- coding: utf-8 -*-
"""
@author   : Wenliang.Yan
@Dep      : Jiduauto_Infra 
@file     : bceclient.py
@create   : 2022/1/7 2:06 上午
"""
# import settings
from . import settings
import requests
import time
from urllib import parse
import hmac
import hashlib
import json


class BDCloudResourcesConfig(object):
    """
    list: 云资源列表查看
    """
    signedHeaders = "content-type;host;x-bce-date"
    x_bce_date = time.gmtime()
    x_bce_date = time.strftime('%Y-%m-%dT%H:%M:%SZ', x_bce_date)
    # 查询参数
    CanonicalQueryString = ''

    def __init__(self, ak, sk, bcchost=settings.BCCHOST, blbhost=settings.BLBHOST, rdshost=settings.RDSHOST,
                 ccehost=settings.CCEHOST):
        self.ak = ak
        self.sk = sk
        self.bcchost = bcchost
        self.blbhost = blbhost
        self.rdshost = rdshost
        self.ccehost = ccehost

    def _generate_authStringPrefix(self):
        return "bce-auth-v1" + "/" + self.ak + "/" + self.x_bce_date + "/" + "1800"

    def _generate_base_header(self, host):
        header = {
            "Host": host,
            "content-type": "application/json;charset=utf-8",
            "x-bce-date": self.x_bce_date
        }
        result = []
        for key, value in header.items():
            tempStr = str(parse.quote(key.lower(), safe="")) + ":" + str(parse.quote(value, safe=""))
            result.append(tempStr)
        result.sort()
        return header, "\n".join(result)

    def _generate_CanonicalRequest(self, host, method, uri, params=None):
        CanonicalURI = parse.quote(uri)
        if params:
            result = []
            for key, value in params.items():
                tempStr = str(parse.quote(key, safe="")) + "=" + str(parse.quote(value, safe=""))
                result.append(tempStr)
            result.sort()
            self.CanonicalQueryString = "&".join(result)
        CanonicalHeaders = self._generate_base_header(host)[1]
        CanonicalRequest = method + "\n" + CanonicalURI + "\n" + self.CanonicalQueryString + "\n" + CanonicalHeaders
        return CanonicalRequest

    def _generate_signingKey(self):
        return hmac.new(self.sk.encode('utf-8'), self._generate_authStringPrefix().encode('utf-8'), hashlib.sha256)

    def _generate_Signature(self, host, method, uri, params):
        return hmac.new((self._generate_signingKey().hexdigest()).encode('utf-8'),
                        self._generate_CanonicalRequest(host, method, uri, params).encode('utf-8'), hashlib.sha256)

    def _generate_header(self, host, method, uri, params):
        header = self._generate_base_header(host)[0]
        header[
            'Authorization'] = self._generate_authStringPrefix() + "/" + self.signedHeaders + "/" + self._generate_Signature(
            host, method, uri, params).hexdigest()
        return header

    def _send_request(self, host, method, uri, params=None, body=None):
        headers = self._generate_header(host, method, uri, params)
        url = 'http://' + host + uri + '?' + self.CanonicalQueryString
        if method == 'GET':
            r = requests.get(url, headers=headers)
            return json.loads(r.text)
        elif method == 'POST':
            r = requests.post(url, headers=headers, data=json.dumps(body))
            return json.loads(r.text)
        else:
            return '其他方法后续补充,暂时不需要'

    # 查询云主机列表
    def list_bcc(self, maxKeys=settings.maxKeys, marker=''):
        return self._send_request(host=self.bcchost, method='GET', uri=settings.bcc_uri,
                                  params={'maxKeys': maxKeys, 'marker': marker})

    # 查询普通型BLB列表
    def list_blb(self, maxKeys=settings.maxKeys, marker=''):
        return self._send_request(host=self.blbhost, method='GET', uri=settings.blb_uri,
                                  params={'maxKeys': maxKeys, 'marker': marker})

    # 查询普通型BLB列表
    def list_app_blb(self, maxKeys=settings.maxKeys, marker=''):
        return self._send_request(host=self.blbhost, method='GET', uri=settings.app_blb_uri,
                                  params={'maxKeys': maxKeys, 'marker': marker})

    # 查询RDS列表
    def list_rds(self, maxKeys=settings.maxKeys, marker=''):
        return self._send_request(host=self.rdshost, method='GET', uri=settings.rds_uri,
                                  params={'maxKeys': maxKeys, 'marker': marker})

    # 查询CCE列表
    def list_cce(self):
        return self._send_request(host=self.ccehost, method='GET', uri=settings.cce_uri)


bceclient = BDCloudResourcesConfig(ak=settings.AK, sk=settings.SK)

