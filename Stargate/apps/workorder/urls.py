from django.urls import path, include
from . import views
from rest_framework.routers import SimpleRouter

router = SimpleRouter()

router.register('workorder', views.WorkOrderViewSet, 'WorkOrderView'),


urlpatterns = [
    path('type/', views.WorkOrderTypeAPIView.as_view()),
    path('ops/', views.WorkOrderOps.as_view()),
    path('', include(router.urls))
]