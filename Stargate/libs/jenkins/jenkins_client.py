# -*- coding: utf-8 -*-
from jenkins import Jenkins
from django.conf import settings


class JenkinsApi:
    def __init__(self):
        self.url = settings.JENKINS_URL
        self.username = settings.JENKINS_USERNAME
        self.password = settings.JENKINS_PASSWORD
        self.server = self.connect()

    def connect(self):
        """
        连接jenkins（实例化jenkins）
        """
        server = Jenkins(self.url, self.username, self.password)
        return server

    def get_next_build_number(self, name):
        """
       获取下一次构建号
       :param name: 任务名称(项目名称)
       :return: "int" number
       """
        return self.server.get_job_info(name)['nextBuildNumber']

    def build_job(self, name, parameters=None, token=None):
        """
       构建任务
       :param name: "str" 任务名称
       :param parameters: "dict" 参数
       :return: "int" queue number
       """
        return self.server.build_job(name=name, parameters=parameters, token=token)

    def get_build_console_output(self, name, number):
        """
        获取终端输出结果
        :param name: "str" 任务名称
        :param number: "str" 构建号
        :return: "str" 结果
        """
        print(name, number)
        return self.server.get_build_console_output(name, number)
