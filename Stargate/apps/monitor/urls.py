from django.urls import path, include
from .views import zbx_views, prom_views
from rest_framework.routers import SimpleRouter

router = SimpleRouter()
# zabbix告警数据录入展示告警
router.register('alert', zbx_views.ZbxApiAlertViews, basename='zabbix-alert')
# router.register('zbxalert', zbx_views.ZbxApiAlertViews, basename='alert')
# prometheus告警数据录入展示告警
router.register('promalert', prom_views.PromApiAlertViews, basename='prom-alert')


urlpatterns = [
    # zbx数据录入
    # path('alert/insert/', zbx_views.ApiAlertViews.as_view(), name='monitor-api-alert'),
    # zbx下拉框数据
    path('alert/alert/type/', zbx_views.AlertTypeView.as_view(), name='monitor-api-alert_type'),
    path('alert/alert/status/', zbx_views.AlertStatusView.as_view(), name='monitor-api-alert_status'),
    path('alert/alert/envs/', zbx_views.AlertEnvView.as_view(), name='monitor-api-alert_envs'),
    # zbx今日告警统计
    path('alert/dashboard/day/', zbx_views.AlertDashboardDayView.as_view(), name='monitor-api-alert-today-dashboard'),
    # zbx告警本月统计
    path('alert/dashboard/month/', zbx_views.AlertDashboardMonthView.as_view(), name='monitor-api-alert_dashboard'),
    # zbx告警本周统计(按类型统计)
    path('alert/dashboard/type/week/', zbx_views.AlertTypeWeekView.as_view(), name='monitor-alert-type-statistics'),
    # zbx告警本周统计(首页)
    path('alert/dashboard/week/', zbx_views.AlertDashboardWeekView.as_view(), name='monitor-alert-week-statistics'),
    # prometheus下拉框数据
    path('alert/promalert/type/', prom_views.PromAlertTypeView.as_view(), name='monitor-api-prom_alert_type'),
    path('alert/promalert/status/', prom_views.PromAlertStatusView.as_view(), name='monitor-api-prom_alert_status'),
    path('alert/promalert/envs/', prom_views.PromAlertEnvView.as_view(), name='monitor-api-prom-alert_envs'),
    path('', include(router.urls))
]
