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


class ReleaseAppView(CommonModelViewSet):
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


class ReleaseApplyView(CommonModelViewSet):
    queryset = ReleaseApply.objects.filter(is_show=True, is_deleted=False)
    serializer_class = ReleaseApplyModelSerializer
    pagination_class = BasicPagination
    filter_backends = [SearchFilter]
    search_fields = ['name']


# 获取发布申请的状态数据
class ReleaseApplyStatus(APIView):
    choice = ReleaseApply.release_status_choices

    def get(self, request):
        methods = [[value[0], value[1]] for value in self.get_choice()]
        return APIResponse(data={'results': methods})

    def get_choice(self):
        assert self.choice is not None, (
                "'%s' 应该包含一个`choice`属性，或覆盖`get_choice()`方法"
                % self.__class__.__name__
        )
        assert isinstance(self.choice, tuple) and len(self.choice) > 0, 'choice数据错误, 应为二元组'
        for values in self.choice:
            assert isinstance(values, tuple) and len(values) == 2, 'choice数据错误, 应该为二维数组'
        return self.choice


# 获取不同环境下的应用数据
class EnvsAppsView(APIView):

    def get(self, request):
        # 获取环境id
        envs_id = request.query_params.get('envs_id')
        envs_apps_data = list(ReleaseRecord.objects.filter(env_id=envs_id).values(
            'release_app__id',
            'release_app__name',
        ).distinct())  # 别忘了去重
        return APIResponse(data=envs_apps_data)


from django.conf import settings
from utils.git_operations import get_git_branchs
from utils.git_operations import get_git_commits


class GitBranchView(APIView):

    def get(self, request):
        app_id = request.query_params.get('app_id')
        # 先找到该应用的新建的最新发布记录
        release_record_obj = ReleaseRecord.objects.filter(is_show=True, is_deleted=False,
                                                          release_app_id=app_id).order_by('-created_time').first()
        git_code_dir = settings.GIT_CODE_DIR
        git_remote_attr = release_record_obj.code_git_addr
        # 获取git仓库的分支数据
        git_branch_list = get_git_branchs(git_remote_attr, git_code_dir)

        # 获得branch -- master等分支的所有提交版本
        branches_name = request.query_params.get('branches')  # master or dev

        git_code_dir = settings.GIT_CODE_DIR
        commits = get_git_commits(branches_name, git_remote_attr, git_code_dir)

        return APIResponse(
            data={'branch_list': git_branch_list, 'commits': commits, 'release_record_id': release_record_obj.id})
