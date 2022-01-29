
import json

from rest_framework import serializers
from Stargate.utils.serializer import CommonModelSerializer


from .models.model import Group, Info, InfoRelatedType, InfoRelated, FieldGroup, Fields
from .models.resources import Data, DataRelated
from .models.tags import Tag, DataTagRelated

class ModelInfoSerializers(CommonModelSerializer):
    class Meta:
        model = Info
        fields = '__all__'

class ModelGroupSerializers(CommonModelSerializer):
    model_list = ModelInfoSerializers(source="groups", many=True, read_only=True)

    class Meta:
        model = Group
        fields = '__all__'

class ModelInfoRelatedTypeSerializers(CommonModelSerializer):
    class Meta:
        model = InfoRelatedType
        fields = '__all__'

class ModelInfoRelatedSerializers(CommonModelSerializer):
    related_type_name = serializers.CharField(source='related_name', read_only=True)
    class Meta:
        model = InfoRelated
        fields = '__all__'

class ModelFieldSerializers(CommonModelSerializer):
    configuration = serializers.JSONField()
    class Meta:
        model = Fields
        fields = '__all__'


class ModelFieldGroupSerializers(CommonModelSerializer):
    fields = ModelFieldSerializers(source='field_groups', many=True, read_only=True)

    class Meta:
        model = FieldGroup
        fields = '__all__'


class ResoucesDataSerializers(CommonModelSerializer):
    info_name = serializers.CharField(source='info_names', read_only=True)
    data = serializers.JSONField()
    class Meta:
        model = Data
        fields = '__all__'

class ResourceDataRelatedSerializers(CommonModelSerializer):
    class Meta:
        model = DataRelated
        fields = '__all__'


class RetrieveInfoSerializers(CommonModelSerializer):
    """
    展示模型的详细信息
    """
    field_group = ModelFieldGroupSerializers(source='infos', many=True, read_only=True)
    class Meta:
        model = Info
        fields = '__all__'