from django.urls import path, include, re_path
from . import views
from rest_framework.routers import SimpleRouter

router = SimpleRouter()

router.register('host', views.HostView, 'HostView')

urlpatterns = [
    path('cmd_exec/', views.CmdExecView.as_view(), name='cmd_exec_view'),
    # path('host/', views.HostView.as_view(), name='host_view'),
    path('', include(router.urls))
]
