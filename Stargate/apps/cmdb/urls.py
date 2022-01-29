
from django.urls import path, include
from .views import model, resources
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register('model/group', model.ModelGroupViewSet, 'ModelGroupView') # 模型组
router.register('model/info', model.ModelInfoViewSet, 'ModelInfoView') # 模型
router.register('model/model-related', model.ModelInfoRelatedViewSet, 'ModelInfoRelatedViewSet') # 模型关系
router.register('model/related-type', model.ModelInfoRelatedTypeViewSet, 'ModelInfoRelatedTypeViewSet') # 模型关系类型
router.register('model/field-group', model.ModelFieldGroupViewSet, 'ModelFieldGroupViewSet') # 字段组
router.register('model/fields', model.ModelFieldsViewSet, 'ModelFieldsViewSet') #字段

router.register('resource/data', resources.ResourceDataViewSet, 'ResourceDataViewSet')


urlpatterns = [
    path('', include(router.urls))
]