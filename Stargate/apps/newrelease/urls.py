from django.urls import path, include, re_path
from rest_framework.routers import SimpleRouter
from . import views
router = SimpleRouter()

router.register('releaseapp', views.ReleaseView, 'ReleaseAppView')

urlpatterns = [
    path('new_release/', views.NewRelease.as_view(), name="create_new_release"),
    path('', include(router.urls))
]
