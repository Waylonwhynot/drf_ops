# Generated by Django 2.2.16 on 2022-02-18 05:02

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0001_initial'),
        ('newrelease', '0004_auto_20220218_0142'),
    ]

    operations = [
        migrations.CreateModel(
            name='ReleaseApply',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('is_show', models.BooleanField(default=True, verbose_name='是否显示')),
                ('orders', models.IntegerField(default=1, verbose_name='排序')),
                ('is_deleted', models.BooleanField(default=False, verbose_name='是否删除')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name='添加时间')),
                ('updated_time', models.DateTimeField(auto_now=True, verbose_name='修改时间')),
                ('apply_title', models.CharField(max_length=64, verbose_name='申请标题')),
                ('git_release_branch_or_tag', models.CharField(choices=[('1', '分支'), ('2', '标签')], default=1, max_length=128, verbose_name='分支/标签')),
                ('git_release_version', models.CharField(max_length=128, verbose_name='发布版本(其实是哪个分支或者哪个标签)')),
                ('git_release_commit_id', models.CharField(blank=True, max_length=256, null=True, verbose_name='git_commit_id')),
                ('release_status', models.CharField(choices=[('1', '待审核'), ('2', '待发布'), ('3', '发布成功'), ('4', '发布异常'), ('5', '其他')], default=1, max_length=32, verbose_name='状态')),
                ('release_desc', models.TextField(blank=True, null=True, verbose_name='备注信息')),
                ('release_record', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='release_record_apply', to='newrelease.ReleaseRecord', verbose_name='发布记录')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='release_apply_user', to='user.UserProfile', verbose_name='申请人')),
            ],
            options={
                'abstract': False,
            },
        ),
    ]
