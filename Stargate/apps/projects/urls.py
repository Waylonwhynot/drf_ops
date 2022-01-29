from django.urls import path, include
from . import views
from rest_framework.routers import SimpleRouter

router = SimpleRouter()
# appid 申请
# router.register('appid', views.AppIDView, 'AppidView')
# router.register('wxmsglogs', views.WxMsgLogsView, 'WxMsgLogsView')

urlpatterns = [
    path('list/', views.ProjectListView.as_view(), name='projects_view'),
    path('tags/', views.ProjectVersionsView.as_view(), name='tags_view'),
    path('taginfo/', views.ProjectVersionInfoView.as_view(), name='tag_info_view'),
    path('', include(router.urls))
]
