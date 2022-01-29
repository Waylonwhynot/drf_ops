from rest_framework import serializers
from rest_framework.generics import ListAPIView
from rest_framework.viewsets import ModelViewSet
from Stargate.utils.response import APIResponse
from rest_framework.response import Response


class ListView(ListAPIView):
    def get(self, request, *args, **kwargs):
        res = super(ListView, self).list(request, *args, **kwargs)
        return APIResponse(data=res.data)


class TreeSerializer(serializers.ModelSerializer):
    """
    TreeAPIView使用的基类序列化器
    """
    id = serializers.IntegerField()
    label = serializers.CharField(max_length=20, source='name')
    pid = serializers.PrimaryKeyRelatedField(read_only=True)


class TreeAPIView(ListAPIView):
    """
    定义Element Tree树结构
    """

    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())
        page = self.paginate_queryset(queryset)
        serializer = self.get_serializer(queryset, many=True)
        tree_dict = {}
        tree_data = []

        try:
            # 未经过分页数据
            # print(serializer.data)
            for item in serializer.data:
                tree_dict[item['id']] = item
            # tree_dict
            # OrderedDict([('id', 1), ('label', '系统管理'), ('pid', None), ('create_time', '2021-03-06T14:27:00.946000+08:00'), ('update_time', '2021-11-06T23:25:06.907355+08:00'), ('name', '系统管理'), ('sign', 'system'), ('menu', True), ('method', ''), ('path', ''), ('desc', '')])
            # i: 1 2 3
            for i in tree_dict:
                # 如果存在pid
                if tree_dict[i]['pid']:
                    pid = tree_dict[i]['pid']
                    parent = tree_dict[pid]
                    parent.setdefault('children', []).append(tree_dict[i])
                else:
                    tree_data.append(tree_dict[i])
            results = tree_data
        except KeyError:
            results = serializer.data
        if page is not None:
            return self.get_paginated_response(results)
        return APIResponse(data=results)


class CommonModelViewSet(ModelViewSet):
    def create(self, request, *args, **kwargs):
        res = super(CommonModelViewSet, self).create(request, *args, **kwargs)
        return APIResponse(data=res.data)

    def retrieve(self, request, *args, **kwargs):
        res = super(CommonModelViewSet, self).retrieve(request, *args, **kwargs)
        return APIResponse(data=res.data)

    def update(self, request, *args, **kwargs):
        print('patch-data', request.data)
        res = super(CommonModelViewSet, self).update(request, *args, **kwargs)
        return APIResponse(data=res.data)

    def destroy(self, request, *args, **kwargs):
        res = super(CommonModelViewSet, self).destroy(request, *args, **kwargs)
        return APIResponse()

    def list(self, request, *args, **kwargs):
        res = super(CommonModelViewSet, self).list(request, *args, **kwargs)
        return APIResponse(data=res.data)


class CommonReadOnlyModelViewSet(ModelViewSet):

    def retrieve(self, request, *args, **kwargs):
        res = super(CommonReadOnlyModelViewSet, self).retrieve(request, *args, **kwargs)
        return APIResponse(data=res.data)

    def list(self, request, *args, **kwargs):
        res = super(CommonReadOnlyModelViewSet, self).list(request, *args, **kwargs)
        return APIResponse(data=res.data)
