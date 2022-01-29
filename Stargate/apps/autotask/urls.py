from django.urls import path, include
from . import views
from rest_framework.routers import SimpleRouter

router = SimpleRouter()
router.register('task', views.TaskViewSet, 'TaskView')

urlpatterns = [
    # path('wechatapp/send/', views.SendMsg.as_view(), name='send_msg_view'),
    path('', include(router.urls))
]
