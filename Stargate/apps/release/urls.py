from django.urls import path, include
from . import views
from rest_framework.routers import SimpleRouter

router = SimpleRouter()

router.register('deploy', views.DeployViewset, 'DeployView')

urlpatterns = [
    # path('list/', views.ProjectListView.as_view(), name='projects_view'),
    # path('tags/', views.ProjectVersionsView.as_view(), name='tags_view'),
    path('', include(router.urls))
]
