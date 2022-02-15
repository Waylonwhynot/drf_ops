from django.shortcuts import render

# Create your views here.
from rest_framework.filters import SearchFilter

from Stargate.utils.logging import get_logger
from utils.pagination import BasicPagination
from utils.views import CommonModelViewSet
from . import models
from .serializer import EnvironmentModelSerializer


class EnvironmentView(CommonModelViewSet):

    queryset = models.Environment.objects.all()
    serializer_class = EnvironmentModelSerializer
    pagination_class = BasicPagination
    filter_backends = [SearchFilter]
    search_fields = ['name']