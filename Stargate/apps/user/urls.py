from django.urls import path, include
from . import views
from rest_framework.routers import SimpleRouter

router = SimpleRouter()
# 用户 、角色 、权限、组织增删改查接口
router.register('permission', views.PermissionView, 'PermissionView'),
router.register('role', views.RoleView, 'RoView')
router.register('org', views.OrganizationView, 'OrgView')
router.register('user', views.UserView, 'UserView')

urlpatterns = [
    path('user/login/', views.UserAuthView.as_view(), name='login_view'),
    path('user/logout/', views.Logout.as_view(), name='logout_view'),
    path('user/info/', views.UserInfoView.as_view(), name='userinfo_view'),
    # path('permissionlist/', views.PermissionListView.as_view(), name='permission_list_view'),
    path('permission/methods/', views.PermissionsMethodsAPIView.as_view()),
    path('', include(router.urls))
]
