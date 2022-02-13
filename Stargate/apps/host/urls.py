from django.urls import path, include, re_path
from . import views
from rest_framework.routers import SimpleRouter

router = SimpleRouter()

router.register('server', views.HostView, 'HostView')

urlpatterns = [
    path('hosttype/', views.HostTypeAPIView.as_view(), name='host_type_view'),
    re_path('^host_excel/', views.HostExcelView.as_view(), name='host_excel_view'),
    re_path('^file/(?P<pk>\d+)/', views.HostFileView.as_view(actions={'get': 'get_folders','post': 'upload_file', 'delete': 'delete_file'})),
    # path('tags/', views.ProjectVersionsView.as_view(), name='tags_view'),
    path('', include(router.urls))
]
