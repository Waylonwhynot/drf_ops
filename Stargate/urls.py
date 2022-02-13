"""Stargate URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, re_path, include
from django.views.static import serve
from django.conf import settings
from rest_framework.permissions import AllowAny

from drf_yasg.views import get_schema_view
from drf_yasg import openapi

schema_view = get_schema_view(
   openapi.Info(
      title="Stargate测试API",
      default_version='v1.0',
      description="Stargate测试接口文档",
      contact=openapi.Contact(email=""),
      license=openapi.License(name="MIT License"),
   ),
   public=True,
   permission_classes=(AllowAny,),
)


urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/autotask/', include('autotask.urls')),
    path('api/system/', include('user.urls')),
    path('api/cmdb/', include('cmdb.urls')),
    path('api/msg/', include('msg.urls')),
    path('api/workorder/', include('workorder.urls')),
    path('api/projects/', include('projects.urls')),
    path('api/release/', include('release.urls')),
    path('api/host/', include('host.urls')),


    # 配置drf-yasg路由
    # re_path('^swagger(?P<format>\.json|\.yaml)$', schema_view.without_ui(cache_timeout=0), name='schema-json'),
    # path('swagger', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
    # path('redoc/', schema_view.with_ui('redoc', cache_timeout=0), name='schema-redoc'),
    # # media文件路径开放
    # re_path('^media/(?P<path>.*)', serve, {'document_root':settings.MEDIA_ROOT})
]
