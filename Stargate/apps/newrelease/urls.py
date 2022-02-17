from django.urls import path, include, re_path
from rest_framework.routers import SimpleRouter
from . import views
router = SimpleRouter()
# 展示应用
router.register('releaseapp', views.ReleaseView, 'ReleaseAppView')
# 发布申请和展示
router.register('release_apply', views.ReleaseApply, 'ReleaseApplyView')

urlpatterns = [
    # 新建发布
    path('new_release/', views.NewRelease.as_view(), name="create_new_release"),
    path('', include(router.urls))
]
