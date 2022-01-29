
from django_filters.rest_framework import FilterSet
from django_filters import CharFilter

from ..models.resources import Data

class ResourceDataFilter(FilterSet):
    model = CharFilter(field_name="info__identifies", label="模型标识")
    s_data = CharFilter(field_name="s_data", method="filter_s_data")

    def filter_s_data(self, queryset, name, value):
        params = self.request.query_params.get('s_data')
        queryset = Data.objects.filter(data__icontains=params)
        return queryset

    class Meta:
        model = Data
        fields = ['model', 's_data']