from django.urls import path, include
from . import views
from rest_framework.routers import SimpleRouter

router = SimpleRouter()
# router.register('appid', views.AppIDView, 'AppidView')

urlpatterns = [
    path('tasks/', views.TaskView.as_view(), name='task_view'),
    path('periods/', views.PeriodView.as_view(), name='period_view'),
    path('', include(router.urls))
]
