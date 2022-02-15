from django.urls import path, include, re_path
from rest_framework.routers import SimpleRouter
from . import views
router = SimpleRouter()

router.register('releaseapp', views.ReleaseView, 'ReleaseAppView')

urlpatterns = [
    # path('hosttype/', views.HostTypeAPIView.as_view(), name='host_type_view'),
    path('', include(router.urls))
]
