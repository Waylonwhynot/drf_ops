# -*- coding: utf-8 -*-
from rest_framework import serializers
from .models import ReleaseApp, ReleaseApply


# 新建发布的序列化器
class ReleaseModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = ReleaseApp
        fields = '__all__'

        extra_kwargs = {
            'id': {'read_only': True},
            'user': {'required': False},
            'app_id': {'required': False}
        }

    def create(self, validated_data):
        obj = ReleaseApp.objects.create(**{
            'name': validated_data.get('name'),
            'user': self.context['request'].user,
            'remark': validated_data.get('remark')
        })
        return obj


# 新建发布申请的序列化器
class ReleaseApplyModelSerializer(serializers.ModelSerializer):
    app_name = serializers.CharField(source='release_record.release_app.name', read_only=True)
    envs_name = serializers.CharField(source='release_record.env.name', read_only=True)
    username = serializers.CharField(source='user.username', read_only=True)

    # 关于git_release_commit_id只有现在选择的是git分支时才需要传递过来进行序列化器的校验，所有我们暂时不对他进行校验，回头再补充

    class Meta:
        model = ReleaseApply
        fields = ['id', 'apply_title', 'app_name', 'envs_name', 'git_release_branch_or_tag',
                  'git_release_branch_or_tag_name', 'git_release_version', 'release_status',
                  'get_release_status_display', 'username', 'created_time', 'release_record', 'review_user','review_desc']
        # branch_or_tag_choices为发布申请的状态数据
        extra_kwargs = {
            'id': {'read_only': True},
            'created_time': {'read_only': True},
            'git_release_branch_or_tag_name': {'read_only': True},
            'get_release_status_display': {'read_only': True},
        }

    # 对数据进行额外的校验
    def validate(self, attrs):
        print(attrs)
        return attrs

    # 自定定制create，因为保存的数据不仅仅是用提交过来的数据，并且该方法的返回值是新创建的记录的模型类对象
    def create(self, validated_data):
        user_id = self.context['request'].user.id  # 用户信息
        new_obj = ReleaseApply.objects.create(**{
            "git_release_branch_or_tag": validated_data.get('git_release_branch_or_tag'),
            "git_release_version": validated_data.get('git_release_version'),
            "apply_title": validated_data.get('apply_title'),
            "git_release_commit_id": validated_data.get('git_release_commit_id'),
            "release_desc": validated_data.get('release_desc'),
            "release_record": validated_data.get('release_record'),
            "user_id": user_id,
        })

        return new_obj