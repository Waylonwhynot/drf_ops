# -*- coding: utf-8 -*-


import baidubce
from baidubce.auth.bce_credentials import BceCredentials
from baidubce.bce_client_configuration import BceClientConfiguration
# 导入BCC相关模块
from baidubce.services.bcc import bcc_client
from baidubce.services.bcc import bcc_model
from baidubce.services.bcc.bcc_model import EphemeralDisk
# blb
from baidubce.services.blb import blb_client, app_blb_client
import settings
from baidubce import exception


class BDCloudResourcesCount(object):
    AK = settings.AK
    SK = settings.SK
    BLBHOST = settings.BLBHOST
    BCCHOST = settings.BCCHOST
    MAX_KEYS = 100
    # BLB client初始化
    BLB_CONFIG = BceClientConfiguration(credentials=BceCredentials(settings.AK, settings.SK), endpoint=BLBHOST)
    BLB_CLIENT = blb_client.BlbClient(BLB_CONFIG)
    APP_BLB_CLIENT = app_blb_client.AppBlbClient(BLB_CONFIG)
    # BCC client初始化
    BCC_CONFIG = BceClientConfiguration(credentials=BceCredentials(settings.AK, settings.SK), endpoint=BCCHOST)
    BCC_CLIENT = bcc_client.BccClient(BCC_CONFIG)

    @property
    def list_blb_lbs(self):
        try:
            res_blb_client = self.BLB_CLIENT.describe_loadbalancers(max_keys=self.MAX_KEYS)
            # 计数
            count = len(res_blb_client.blb_list)
            # 为True, 则后面分页还有数据
            while res_blb_client.is_truncated:
                # 结束位置,下一次循环起始位置
                next_marker = res_blb_client.next_marker
                res_blb_client = self.BLB_CLIENT.describe_loadbalancers(max_keys=self.MAX_KEYS, marker=next_marker)
                count += len(res_blb_client.blb_list)
            return 'lb', count
        except BaseException as e:
            # logger.error('百度云调用失败: %s' % str(e))
            return False, str(e)

    @property
    def list_blb_app_lbs(self):
        try:
            res_app_blb_client = self.APP_BLB_CLIENT.describe_app_loadbalancers(max_keys=self.MAX_KEYS)
            # 计数
            count = len(res_app_blb_client.blb_list)
            # 为True, 则后面分页还有数据
            while res_app_blb_client.is_truncated:
                # 结束位置,下一次循环起始位置
                next_marker = res_app_blb_client.next_marker
                res_blb_client = self.APP_BLB_CLIENT.describe_app_loadbalancers(max_keys=self.MAX_KEYS,
                                                                                marker=next_marker)
                count += len(res_app_blb_client.blb_list)
            return 'app_lb', count
        except BaseException as e:
            # logger.error('百度云调用失败: %s' % str(e))
            return False, str(e)

    @property
    def list_bcc_instances(self):
        try:
            res_bcc_client = self.BCC_CLIENT.list_instances(max_keys=self.MAX_KEYS)
            # 计数
            count = len(res_bcc_client.instances)
            # 为True, 则后面分页还有数据
            while res_bcc_client.is_truncated:
                # 结束位置,下一次循环起始位置
                next_marker = res_bcc_client.next_marker
                res_bcc_client = self.BCC_CLIENT.list_instances(max_keys=self.MAX_KEYS, marker=next_marker)
                count += len(res_bcc_client.blb_list)
            return 'bcc', count
        except BaseException as e:
            # logger.error('百度云调用失败: %s' % str(e))
            return False, str(e)