from django.db import models


# Create your models here.

class AlertCenter(models.Model):
    """
    zabbix告警表
    """
    monitor_types = (
        ('zabbix', 'zabbix'),
    )
    envs = (
        ('TEST', 'TEST'),
        ('PRO', 'PRO'),
    )
    alert_types = (
        ('cpu', 'CPU'),
        ('mem', 'MEM'),
        ('disk', '硬盘'),
        ('tcp', '连接数'),
        ('netflow', '带宽'),
        ('unknown', '未分类'),
        ('db', 'DB'),
        ('unreachable', '无法连接'),
    )
    status_type = (
        ('alert', '告警中'),
        ('recovery', '已恢复')
    )
    eventID = models.CharField(max_length=128, verbose_name='告警ID')
    TriggerID = models.CharField(max_length=128, blank=True, null=True, verbose_name='TriggerID')
    env = models.CharField(choices=envs, max_length=16, verbose_name='环境')
    eventName = models.CharField(verbose_name='告警名称', max_length=512, blank=True, null=True)
    eventMessage = models.CharField(max_length=1024, null=True, blank=True, verbose_name='告警内容')
    hostname = models.CharField(max_length=128, verbose_name='告警主机')
    eventLevel = models.CharField(max_length=64, verbose_name='告警级别')
    eventType = models.CharField(choices=monitor_types, max_length=64, verbose_name='监控类型')
    status = models.CharField(choices=status_type, max_length=32, default='alert', verbose_name='告警状态')
    startTime = models.DateTimeField(verbose_name='告警时间', blank=True, null=True)
    recoveryTime = models.DateTimeField(verbose_name='恢复时间', blank=True, null=True)
    alert_type = models.CharField(choices=alert_types, max_length=64, verbose_name='告警大类', default='unknown')
    alertTime = models.CharField(max_length=64, verbose_name='处理时长', blank=True, null=True)
    department = models.CharField(max_length=64, default='unknown', blank=True, null=True, verbose_name="所属部门")

    class Meta:
        verbose_name = '告警表'
        verbose_name_plural = '告警表'

    def __str__(self):
        return "%s-%s-%s" % (self.TriggerID, self.hostname, self.env)


class PromAlertCenter(models.Model):
    envs = (
        ('TEST', 'TEST'),
        ('PRO', 'PRO'),
    )
    status_type = (
        ('firing', '告警中'),
        ('resolved', '已恢复')
    )
    alert_types = (
        ('CpuUsage', 'CPU'),
        ('DiskSpaceUsage', '硬盘'),
        ('DiskFilling', '硬盘'),
        ('NetInterfaceUsage', '带宽'),
        ('MemoryExhausted', '内存'),
        ('MemoryLow', '内存'),
        ('Blackbox web probe', '站点拨测异常'),
        ('BlackboxSlowProbe', '站点响应时间过长'),
        ('PodNotReady', 'PodNotReady'),
        ('PodCrashLooping', 'PodCrashLooping'),
        ('KubernetesNodeReady', 'k8s-node节点故障'),
        ('KubernetesMemoryPressure', 'k8s-node节点内存过低'),
        ('HostHighIOwait', 'IO过高'),
        ('HostReboot', '节点重启'),
        ('HostOutOfMemory', '内存'),
        ('HostOutOfDiskSpace', '硬盘'),
        ('HostHighCpuLoad', 'CPU'),
        ('HostOomKillDetected', '内存'),
        ('HostDown', '宕机'),
        ('PrometheusConfigurationReloadFailure', 'prometheus配置错误'),
        ('PrometheusAlertmanagerConfigurationReloadFailure', 'alertmanager配置错误'),
        ('unknown', '未分类')
    )
    fingerprint = models.CharField(max_length=256, verbose_name='指纹', null=True)
    env = models.CharField(choices=envs, max_length=16, verbose_name='环境')
    eventLevel = models.CharField(max_length=64, verbose_name='告警级别')
    eventService = models.CharField(max_length=64, null=True, blank=True, verbose_name='告警业务')
    alertType = models.CharField(choices=alert_types, max_length=64, verbose_name='告警类型', default='unknown')
    hostname = models.CharField(max_length=128, verbose_name='告警主机')
    eventMessage = models.CharField(max_length=1024, null=True, blank=True, verbose_name='告警详情')
    status = models.CharField(choices=status_type, max_length=32, default='alert', verbose_name='告警状态')
    startTime = models.DateTimeField(verbose_name='告警时间', blank=True, null=True)
    recoveryTime = models.DateTimeField(verbose_name='恢复时间', blank=True, null=True)
    alertTime = models.CharField(max_length=64, verbose_name='处理时长', blank=True, null=True)
    department = models.CharField(max_length=64, default='unknown', blank=True, null=True, verbose_name="所属部门")



