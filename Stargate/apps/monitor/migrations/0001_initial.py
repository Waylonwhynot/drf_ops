# Generated by Django 2.2.16 on 2022-02-20 04:04

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='AlertCenter',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('eventID', models.CharField(max_length=128, verbose_name='告警ID')),
                ('TriggerID', models.CharField(blank=True, max_length=128, null=True, verbose_name='TriggerID')),
                ('env', models.CharField(choices=[('TEST', 'TEST'), ('PRO', 'PRO')], max_length=16, verbose_name='环境')),
                ('eventName', models.CharField(blank=True, max_length=512, null=True, verbose_name='告警名称')),
                ('eventMessage', models.CharField(blank=True, max_length=1024, null=True, verbose_name='告警内容')),
                ('hostname', models.CharField(max_length=128, verbose_name='告警主机')),
                ('eventLevel', models.CharField(max_length=64, verbose_name='告警级别')),
                ('eventType', models.CharField(choices=[('zabbix', 'zabbix')], max_length=64, verbose_name='监控类型')),
                ('status', models.CharField(choices=[('alert', '告警中'), ('recovery', '已恢复')], default='alert', max_length=32, verbose_name='告警状态')),
                ('startTime', models.DateTimeField(blank=True, null=True, verbose_name='告警时间')),
                ('recoveryTime', models.DateTimeField(blank=True, null=True, verbose_name='恢复时间')),
                ('alert_type', models.CharField(choices=[('cpu', 'CPU'), ('mem', 'MEM'), ('disk', '硬盘'), ('tcp', '连接数'), ('netflow', '带宽'), ('unknown', '未分类'), ('db', 'DB'), ('unreachable', '无法连接')], default='unknown', max_length=64, verbose_name='告警大类')),
                ('alertTime', models.CharField(blank=True, max_length=64, null=True, verbose_name='处理时长')),
                ('department', models.CharField(blank=True, default='unknown', max_length=64, null=True, verbose_name='所属部门')),
            ],
            options={
                'verbose_name': '告警表',
                'verbose_name_plural': '告警表',
            },
        ),
        migrations.CreateModel(
            name='PromAlertCenter',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fingerprint', models.CharField(max_length=256, null=True, verbose_name='指纹')),
                ('env', models.CharField(choices=[('TEST', 'TEST'), ('PRO', 'PRO')], max_length=16, verbose_name='环境')),
                ('eventLevel', models.CharField(max_length=64, verbose_name='告警级别')),
                ('eventService', models.CharField(blank=True, max_length=64, null=True, verbose_name='告警业务')),
                ('alertType', models.CharField(choices=[('CpuUsage', 'CPU'), ('DiskSpaceUsage', '硬盘'), ('DiskFilling', '硬盘'), ('NetInterfaceUsage', '带宽'), ('MemoryExhausted', '内存'), ('MemoryLow', '内存'), ('Blackbox web probe', '站点拨测异常'), ('BlackboxSlowProbe', '站点响应时间过长'), ('PodNotReady', 'PodNotReady'), ('PodCrashLooping', 'PodCrashLooping'), ('KubernetesNodeReady', 'k8s-node节点故障'), ('KubernetesMemoryPressure', 'k8s-node节点内存过低'), ('HostHighIOwait', 'IO过高'), ('HostReboot', '节点重启'), ('HostOutOfMemory', '内存'), ('HostOutOfDiskSpace', '硬盘'), ('HostHighCpuLoad', 'CPU'), ('HostOomKillDetected', '内存'), ('HostDown', '宕机'), ('PrometheusConfigurationReloadFailure', 'prometheus配置错误'), ('PrometheusAlertmanagerConfigurationReloadFailure', 'alertmanager配置错误'), ('unknown', '未分类')], default='unknown', max_length=64, verbose_name='告警类型')),
                ('hostname', models.CharField(max_length=128, verbose_name='告警主机')),
                ('eventMessage', models.CharField(blank=True, max_length=1024, null=True, verbose_name='告警详情')),
                ('status', models.CharField(choices=[('firing', '告警中'), ('resolved', '已恢复')], default='alert', max_length=32, verbose_name='告警状态')),
                ('startTime', models.DateTimeField(blank=True, null=True, verbose_name='告警时间')),
                ('recoveryTime', models.DateTimeField(blank=True, null=True, verbose_name='恢复时间')),
                ('alertTime', models.CharField(blank=True, max_length=64, null=True, verbose_name='处理时长')),
                ('department', models.CharField(blank=True, default='unknown', max_length=64, null=True, verbose_name='所属部门')),
            ],
        ),
    ]
