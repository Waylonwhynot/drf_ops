
from rest_framework import serializers

class CommonModelSerializer(serializers.ModelSerializer):
    create_time = serializers.DateTimeField(format='%Y-%m-%d %H:%M', required=False, read_only=True)
    update_time = serializers.DateTimeField(format='%Y-%m-%d %H:%M', required=False, read_only=True)