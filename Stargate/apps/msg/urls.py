from django.urls import path, include
from . import views
from rest_framework.routers import SimpleRouter

router = SimpleRouter()
# appid 申请
router.register('appid', views.AppIDView, 'AppidView')
router.register('wxmsglogs', views.WxMsgLogsView, 'WxMsgLogsView')

urlpatterns = [
    path('wechatapp/send/', views.SendMsg.as_view(), name='send_msg_view'),
    path('', include(router.urls))
]
