from django.db import models

# Create your models here.
from Stargate.utils.functions import GenerateShortId
from confcenter.models import Environment
from host.models import Host
from utils.models import BaseModel
from django.contrib.auth import get_user_model

User = get_user_model()


class ReleaseApp(BaseModel):
    """
    应用表
    """
    name = models.CharField(max_length=32)
    app_id = models.CharField(default=GenerateShortId, editable=False, max_length=32, verbose_name='应用唯一标识号')
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, verbose_name='用户')
    remark = models.TextField(verbose_name='备注信息', null=True, blank=True)



# 发布记录表
class ReleaseRecord(BaseModel):
    msg_type_choices = (
        (0, '关闭'),
        (1, '钉钉'),
        (2, '短信'),
        (3, '邮件'),
    )

    file_filter_choices = (
        (0, '包含'),
        (1, '排除'),

    )

    release_app = models.ForeignKey(ReleaseApp, on_delete=models.CASCADE, related_name='release_appliction', default=1,
                                    verbose_name='发布从属应用')

    env = models.ForeignKey(Environment, on_delete=models.CASCADE, related_name='release_envs', verbose_name='发布环境')
    code_git_addr = models.CharField(max_length=128, verbose_name='Git仓库地址,注意我们使用的是ssh地址')
    # 应该加一个项目名称字段，因为我们将来可能要存储多个项目，通过项目名称进行区分和作为将来存放该项目的目录名称
    # git_project_name = models.CharField(max_length=128,verbose_name='项目名称\目录名称')
    # 有了项目名称字段，那么保存数据的时候别忘了添加该字段的数据，其实就通过git仓库地址就能分离出名称

    msg_notice_status = models.BooleanField(default=False, verbose_name='发布审核开启')  # 默认是没有开启审核通知的

    msg_type = models.IntegerField(choices=msg_type_choices, default=0, verbose_name='审核通知方式')
    msg_content = models.CharField(max_length=128, verbose_name='审核通知内容')
    target_host_pub_path = models.CharField(max_length=128, verbose_name='目标主机代码目录')
    target_host_repository_path = models.CharField(max_length=128, verbose_name='目标主机代码历史版本')
    keep_history_count = models.IntegerField(verbose_name='历史版本数量')
    filefilterway = models.IntegerField(choices=file_filter_choices, verbose_name='文件过滤方式', help_text='默认是包含')
    file_filter_cmd_content = models.TextField(verbose_name='需要过滤的文件或者目录,通过换行符分隔', null=True, blank=True)
    before_code_check_out_value = models.TextField(verbose_name='代码检出前的执行动作')
    before_release_content = models.TextField(verbose_name='代码发布前的执行动作', null=True, blank=True, help_text='在管理的目标主机执行')
    custom_global_variable = models.TextField(verbose_name='全局变量', null=True, blank=True, help_text='全局变量设置')
    after_code_check_out_value = models.TextField(verbose_name='代码检出后的动作', help_text='在Hippo项目所在服务器执行的', null=True,
                                                  blank=True)
    after_release_value = models.TextField(verbose_name='代码发布后执行', help_text='在目标主机执行的', null=True, blank=True)


# 发布记录详情表，存储的主要是主机信息
class ReleaseRecordDetail(BaseModel):
    record = models.ForeignKey('ReleaseRecord', related_name='release_record', on_delete=models.CASCADE,
                               verbose_name='发布记录')
    hosts = models.ForeignKey(Host, on_delete=models.CASCADE, related_name='release_host', verbose_name='发布的主机')

# 先进行发布，然后进行发布申请，在发布申请阶段进行真正的发布流程
# 发布申请记录表
class ReleaseApply(BaseModel):

    release_status_choices = (
        ('1', '待审核'),
        ('2', '待发布'),
        ('3', '发布成功'),
        ('4', '发布异常'),
        ('5', '其他'),
    )

    branch_or_tag_choices = (
        ('1', '分支'),
        ('2', '标签'),
    )

    apply_title = models.CharField(max_length=64, verbose_name='申请标题')

    release_record = models.ForeignKey('ReleaseRecord', on_delete=models.CASCADE, verbose_name='发布记录', related_name='release_record_apply')

    # git_release_branch = models.CharField(max_length=128,verbose_name='分支',null=True, blank=True)
    # git_release_tag = models.CharField(max_length=128,verbose_name='git标签',null=True, blank=True)
    git_release_branch_or_tag = models.CharField(max_length=128, verbose_name='分支/标签', choices=branch_or_tag_choices, default=1)
    git_release_version = models.CharField(max_length=128, verbose_name='发布版本(其实是哪个分支或者哪个标签)')
    git_release_commit_id = models.CharField(max_length=256,verbose_name='git_commit_id',null=True,blank=True)

    release_status = models.CharField(choices=release_status_choices, default=1, verbose_name='状态',max_length=32)
    release_desc = models.TextField(verbose_name='备注信息',null=True,blank=True)
    user = models.ForeignKey(User, verbose_name='申请人', on_delete=models.CASCADE, related_name='release_apply_user')

    def git_release_branch_or_tag_name(self):
        return self.get_git_release_branch_or_tag_display()


