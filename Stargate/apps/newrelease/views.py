from django.db import transaction
from django.shortcuts import render

# Create your views here.
from rest_framework.filters import SearchFilter
from rest_framework.views import APIView

from utils.pagination import BasicPagination
from utils.response import APIResponse
from utils.views import CommonModelViewSet
from .models import ReleaseApp, ReleaseRecord, ReleaseRecordDetail, ReleaseApply
from .serializer import ReleaseModelSerializer, ReleaseApplyModelSerializer
import logging

logger = logging.getLogger('error')


class ReleaseView(CommonModelViewSet):
    queryset = ReleaseApp.objects.all()
    serializer_class = ReleaseModelSerializer
    pagination_class = BasicPagination
    filter_backends = [SearchFilter]
    search_fields = ['name']


class NewRelease(APIView):
    """
    新建发布
    """

    def post(self, request):
        print('新建发布的数据： ', request.data)
        # 按理来讲，应该对数据进行校验，我这里就不做了，直接保存
        # 默认发布状态为待审核
        all_data = request.data
        host_ids = all_data.pop('pub_target_host_choose')
        # 【2, 3, 4】

        # 由于有两张表的数据要同时保存，所以我们要开启事务
        with transaction.atomic():
            # sid = transaction.savepoint() #创建保存点
            try:
                re_record_obj = ReleaseRecord.objects.create(**all_data)
                # 可以改成批量插入bulk_create
                for host_id in host_ids:
                    ReleaseRecordDetail.objects.create(
                        record_id=re_record_obj.id,
                        hosts_id=host_id
                    )

            except Exception as e:
                print(e)
                # 回滚
                # transaction.savepoint_rollback(sid)
                # 记录日志
                error_msg = f'新建发布失败，请联系管理员,错误信息为{str(e)}'
                logger.error(error_msg)
                # 回复错误信息
                return APIResponse(errors=error_msg, status=507)

        return APIResponse()


# 新建发布的数据：
"""
{
	'release_app_id': 1, 发布从属的应用id
	'envs_id': 1, 发布环境
	'code_git_addr': 'git@gitee.com:s32-private-club/spa.git', git仓库的ssh地址
	'msg_notice_status': True,#消息通知状态是否开启，True表示开启
	'msg_type': 1,#消息通知类型（钉钉、短信等）
	'msg_content': 消息通知内容
	#  'release_status': 1, #发布状态  这个放到发布申请的表中了
	'target_host_pub_path': '/var/www/html', 代码发布到目标主机的路径
	'target_host_repository_path': '/data/hippo/repos', 代码版本管理目录
	'keep_history_count': '10', 代码版本存储个数
	'pub_target_host_choose': [11, 10], 目标主机的id列表
	'filefilterway': 1,  # 文件过滤方式 1表示包含，2表示过滤
	'file_filter_cmd_content': 'readme.txt\nreadme.md', 代码文件过滤的指令
	'before_code_check_out_value': 'mkdir xxx', 代码检出前的执行指令
	'before_release_content': 'mkdir kkk', 代码发布前的执行指令
	'custom_global_variable': "user='root'\npassword='123'", 代码所需的全局变量
	'after_code_check_out_value': 'mkdir ooo', 代码检出后执行的指令
	'after_release_value': 'mkdir vvv' 代码发布后执行的指令
}
"""


class ReleaseApply(CommonModelViewSet):
    queryset = ReleaseApply.objects.filter(is_show=True, is_deleted=False)
    serializer_class = ReleaseApplyModelSerializer
    pagination_class = BasicPagination
    filter_backends = [SearchFilter]
    search_fields = ['name']


# 获取发布申请的状态数据
class ReleaseApplyStatus(APIView):
    def get(self, request):
        status = ReleaseApply.release_status_choices
        return APIResponse(data={'status_data': status})
