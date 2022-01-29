
import json
from django_redis import get_redis_connection
from rest_framework.filters import SearchFilter, OrderingFilter
# from django_filters.rest_framework import DjangoFilterBackend
from django_filters.rest_framework import DjangoFilterBackend

from Stargate.utils.views import CommonModelViewSet
from Stargate.utils.pagination import BasicPagination
from ..serliazer import ResoucesDataSerializers, ResourceDataRelatedSerializers
from ..models import resources
from ..filters.resources import ResourceDataFilter


class ResourceDataViewSet(CommonModelViewSet):
    """
    资源数据
    """    
    queryset = resources.Data.objects.all().order_by('id')
    serializer_class = ResoucesDataSerializers
    pagination_class = BasicPagination
    filter_backends = [DjangoFilterBackend]
    filter_class = ResourceDataFilter



class ResourceDataRelatedViewSet(CommonModelViewSet):
    """
    资源数据关系
    """    
    queryset = resources.DataRelated.objects.all().order_by('id')
    serializer_class = ResourceDataRelatedSerializers