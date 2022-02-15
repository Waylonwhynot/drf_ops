from django.shortcuts import render

# Create your views here.
from rest_framework.filters import SearchFilter

from utils.pagination import BasicPagination
from utils.views import CommonModelViewSet
from .models import ReleaseApp
from .serializer import ReleaseModelSerializer


class ReleaseView(CommonModelViewSet):
    queryset = ReleaseApp.objects.all()
    serializer_class = ReleaseModelSerializer
    pagination_class = BasicPagination
    filter_backends = [SearchFilter]
    search_fields = ['name']
