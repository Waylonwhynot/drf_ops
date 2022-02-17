# Generated by Django 2.2.16 on 2022-02-16 22:56

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('host', '0004_host_environments'),
        ('confcenter', '0001_initial'),
        ('newrelease', '0002_auto_20220216_2103'),
    ]

    operations = [
        migrations.CreateModel(
            name='ReleaseRecord',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('is_show', models.BooleanField(default=True, verbose_name='是否显示')),
                ('orders', models.IntegerField(default=1, verbose_name='排序')),
                ('is_deleted', models.BooleanField(default=False, verbose_name='是否删除')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name='添加时间')),
                ('updated_time', models.DateTimeField(auto_now=True, verbose_name='修改时间')),
                ('code_git_addr', models.CharField(max_length=128, verbose_name='Git仓库地址,注意我们使用的是ssh地址')),
                ('msg_notice_status', models.BooleanField(default=False, verbose_name='发布审核开启')),
                ('msg_type', models.IntegerField(choices=[(0, '关闭'), (1, '钉钉'), (2, '短信'), (3, '邮件')], default=0, verbose_name='审核通知方式')),
                ('msg_content', models.CharField(max_length=128, verbose_name='审核通知内容')),
                ('target_host_pub_path', models.CharField(max_length=128)),
                ('target_host_repository_path', models.CharField(max_length=128)),
                ('keep_history_count', models.IntegerField()),
                ('filefilterway', models.IntegerField(choices=[(0, '包含'), (1, '排除')], help_text='默认是包含', verbose_name='文件过滤方式')),
                ('file_filter_cmd_content', models.TextField(blank=True, null=True, verbose_name='需要过滤的文件或者目录,通过换行符分隔')),
                ('before_code_check_out_value', models.TextField(verbose_name='代码检出前的执行动作')),
                ('before_release_content', models.TextField(blank=True, help_text='在管理的目标主机执行', null=True, verbose_name='代码发布前的执行动作')),
                ('custom_global_variable', models.TextField(blank=True, help_text='全局变量设置', null=True, verbose_name='全局变量')),
                ('after_code_check_out_value', models.TextField(blank=True, help_text='在Hippo项目所在服务器执行的', null=True, verbose_name='代码检出后的动作')),
                ('after_release_value', models.TextField(blank=True, help_text='在目标主机执行的', null=True, verbose_name='代码发布后执行')),
                ('envs', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='release_envs', to='confcenter.Environment', verbose_name='发布环境')),
                ('release_app', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='release_appliction', to='newrelease.ReleaseApp', verbose_name='发布从属应用')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='ReleaseRecordDetail',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('is_show', models.BooleanField(default=True, verbose_name='是否显示')),
                ('orders', models.IntegerField(default=1, verbose_name='排序')),
                ('is_deleted', models.BooleanField(default=False, verbose_name='是否删除')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name='添加时间')),
                ('updated_time', models.DateTimeField(auto_now=True, verbose_name='修改时间')),
                ('hosts', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='release_host', to='host.Host', verbose_name='发布的主机')),
                ('record', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='release_record', to='newrelease.ReleaseRecord', verbose_name='发布记录')),
            ],
            options={
                'abstract': False,
            },
        ),
    ]