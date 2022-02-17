# Generated by Django 2.2.16 on 2022-02-18 01:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('newrelease', '0003_releaserecord_releaserecorddetail'),
    ]

    operations = [
        migrations.RenameField(
            model_name='releaserecord',
            old_name='envs',
            new_name='env',
        ),
        migrations.AlterField(
            model_name='releaserecord',
            name='keep_history_count',
            field=models.IntegerField(verbose_name='历史版本数量'),
        ),
        migrations.AlterField(
            model_name='releaserecord',
            name='target_host_pub_path',
            field=models.CharField(max_length=128, verbose_name='目标主机代码目录'),
        ),
        migrations.AlterField(
            model_name='releaserecord',
            name='target_host_repository_path',
            field=models.CharField(max_length=128, verbose_name='目标主机代码历史版本'),
        ),
    ]