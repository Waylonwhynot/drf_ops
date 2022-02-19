# -*- coding: utf-8 -*-

from django.urls import path, include
from . import views
from rest_framework.routers import SimpleRouter

router = SimpleRouter()

# router.register('bdcloud', views.BdcloudListResources, 'BdCloudResourceView')


urlpatterns = [
    path('bdcloud/list/', views.BdcloudListResources.as_view(), name='BdCloudResourceView'),
    path('', include(router.urls))
]