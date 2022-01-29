from django.shortcuts import render

# Create your views here.
from rest_framework.views import APIView

from Stargate.utils.response import APIResponse

from libs.gitlab import get_user_projects, get_project_versions


class ProjectListView(APIView):
    """
    登录用户所有项目列表
    """

    def get(self, request):
        projects = get_user_projects(request)
        res = []
        for project in projects:
            project_dict = {}
            project_dict['id'] = project.id
            project_dict['name'] = project.name
            project_dict['path_with_namespace'] = project.path_with_namespace
            project_dict['web_url'] = project.web_url
            project_dict['description'] = project.description
            res.append(project_dict)
        return APIResponse(data=res)


class ProjectVersionsView(APIView):
    """
    获取指定项目的所有版本
    """

    def get(self, request):
        # project_id = request.GET.get('project_id')
        project_parameter = request.GET.get('project') # 项目名称或者项目id
        project_tag = request.GET.get('tag')
        if not project_parameter.isdigit():
            projects = get_user_projects(request)
            project_id = 0  # 初始默认项目id
            for project in projects:
                if project.name == project_parameter:
                    project_id = project.id
            # tags = get_project_versions(int(project_id))
            tags = get_project_versions(project_id)
            res_data = []
            for tag in tags:
                res_data.append({'label': tag.name, 'value': tag.message})
            return APIResponse(data=res_data)
        else:
            tags = get_project_versions(int(project_parameter))
            res_data = []
            for tag in tags:
                res_data.append({'label': tag.name, 'value': tag.message})
            return APIResponse(data=res_data)


class ProjectVersionInfoView(APIView):
    def get(self, request):
        project_tag = request.GET.get('tag')
        project_name = request.GET.get('project')
        projects = get_user_projects(request)
        project_id = 0  # 初始默认项目id
        for project in projects:
            if project.name == project_name:
                project_id = project.id
        # tags = get_project_versions(int(project_id))
        tags = get_project_versions(project_id)
        tag_info = ''
        for tag in tags:
            if tag.name == project_tag:
                tag_info = tag.message

        return APIResponse(data=tag_info)
