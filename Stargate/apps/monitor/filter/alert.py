# -*- coding: utf-8 -*-

from django_filters.filterset import FilterSet
from monitor.models import AlertCenter
from django_filters import filters


class AlertCenterFilter(FilterSet):
    # 开始时间
    start_time = filters.DateTimeFilter(field_name='startTime', lookup_expr='gt')
    # 结束时间
    end_time = filters.DateTimeFilter(field_name='startTime', lookup_expr='lt')

    class Meta:
        model = AlertCenter
        fields = ['alert_type', 'status', 'env', 'startTime']
