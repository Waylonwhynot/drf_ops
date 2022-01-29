# -*- coding: utf-8 -*-
import gitlab
from django.conf import settings

gl = gitlab.Gitlab(settings.GITLAB_HTTP_URI, settings.GITLAB_TOKEN, api_version=4)


def get_user_projects(request):
    """
    获取gitlab里所有的项目，和登录用户所拥有的项目,以及登录用户所拥有项目的项目成员
    :return: []
    """
    user_projects = []
    all_projects = gl.projects.list()

    # 获取当前用户所有项目
    if request.user.username == 'admin':
        request.user.username = 'Administrator'
    for project in all_projects:
        for member in project.members.list():
            if member.name == request.user.username:
                user_projects.append(project)
    return user_projects

def get_project_versions(project_id):
    """
    获取某个项目的版本号
    :param project_id:
    :return:
    """
    project = gl.projects.get(project_id)
    tags = project.tags.list()
    return tags

def get_project_id(project_name):
    """
    获取项目id
    :param project_name
    :return:
    """
    project_id = gl.projects.get