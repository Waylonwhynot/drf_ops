from django.urls import path, include, re_path
from rest_framework.routers import SimpleRouter
from . import views
router = SimpleRouter()
# 展示应用
router.register('releaseapp', views.ReleaseAppView, 'ReleaseAppView')
# 新建发布申请和展示
router.register('release_apply', views.ReleaseApplyView, 'ReleaseApplyView')

urlpatterns = [
    #
    path('envs/apps/', views.EnvsAppsView.as_view(), name="env_app_view"),
    # 新建发布
    path('new_release/', views.NewRelease.as_view(), name="create_new_release"),
    # 申请状态的接口
    path('release_apply/status/', views.ReleaseApplyStatus.as_view(), name="release_status_view"),
    path('git/branches/', views.GitBranchView.as_view(), name="git_branch_view"),
    path('', include(router.urls))
]
