
import json
from django_redis import get_redis_connection
from rest_framework.filters import SearchFilter, OrderingFilter

from Stargate.utils.views import CommonModelViewSet, ListView
from ..serliazer import ModelGroupSerializers, ModelInfoSerializers, ModelInfoRelatedTypeSerializers, \
    ModelInfoRelatedSerializers, ModelFieldGroupSerializers, ModelFieldGroupSerializers, RetrieveInfoSerializers, \
    ModelFieldSerializers
from ..models import model


class ModelGroupViewSet(CommonModelViewSet):
    """
    模型组
    """    
    queryset = model.Group.objects.all().order_by('id')
    serializer_class = ModelGroupSerializers
    filter_backends = [SearchFilter]
    search_fields = ['name']

class ModelInfoViewSet(CommonModelViewSet):
    """
    模型
    """    
    queryset = model.Info.objects.all().order_by('id')
    serializer_class = ModelInfoSerializers
    filter_backends = [SearchFilter]
    search_fields = ['name', 'is_usable']

    def get_serializer_class(self):
        if self.action == 'retrieve':
            return RetrieveInfoSerializers
        return self.serializer_class

class ModelInfoRelatedTypeViewSet(CommonModelViewSet):
    """
    模型关系类型
    """    
    queryset = model.InfoRelatedType.objects.all().order_by('id')
    serializer_class = ModelInfoRelatedTypeSerializers

class ModelInfoRelatedViewSet(CommonModelViewSet):
    """
    模型关系
    """    
    queryset = model.InfoRelated.objects.all().order_by('id')
    serializer_class = ModelInfoRelatedSerializers


class ModelFieldGroupViewSet(CommonModelViewSet):
    """
    字段组
    """
    queryset = model.FieldGroup.objects.all().order_by('id')
    serializer_class = ModelFieldGroupSerializers

class ModelFieldsViewSet(CommonModelViewSet):
    """
    字段
    """    
    queryset = model.Fields.objects.all().order_by('id')
    serializer_class = ModelFieldSerializers