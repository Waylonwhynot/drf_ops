from django.urls import path, include, re_path
from rest_framework.routers import SimpleRouter
from . import views
router = SimpleRouter()

router.register('env', views.EnvironmentView, 'EnvView')

urlpatterns = [
    # path('hosttype/', views.HostTypeAPIView.as_view(), name='host_type_view'),
    path('', include(router.urls))
]
