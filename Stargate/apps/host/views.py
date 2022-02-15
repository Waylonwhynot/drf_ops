from io import BytesIO

import xlwt
from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
# 申请appid
from rest_framework import status
from rest_framework.decorators import action
from rest_framework.views import APIView
from rest_framework.viewsets import ViewSet

from utils.handle_key import AppSetting
from utils.pagination import BasicPagination
from utils.response import APIResponse
from utils.views import CommonModelViewSet
from . import models
from .serializer import HostModelSerializer
from utils.read_host_excel import read_host_excel_data


class HostView(CommonModelViewSet):
    queryset = models.Host.objects.all().order_by('id')
    serializer_class = HostModelSerializer
    pagination_class = BasicPagination
    # 基于请求中携带的查询参数完成不同环境的主机数据筛选
    # self.request 中可以拿到请求对象
    def get_queryset(self):
        env_id = self.request.data.get['env_id']
        if env_id:
            queryset = self.queryset.filter(environments_id=env_id)
            return queryset
        return self.queryset


class HostTypeAPIView(APIView):
    """
    返回主机类型数据
    """

    choice = models.HostCategory.objects.all()

    def get(self, request):
        host_type = [{'value': value.id, 'label': value.name} for value in self.choice]
        return APIResponse(data={'results': host_type})


class HostExcelView(APIView):
    authentication_classes = []
    permission_classes = []

    # 上传host数据excel文件
    def post(self, request):
        # request.data中能够拿到通过formdata上传的文件和其他键值对数据
        # request.data>>>> <QueryDict: {'default_password': ['123'], 'host_excel': [<InMemoryUploadedFile: 教学日志模版-吴超-2019年11月份.xlsx (application/vnd.openxmlformats-officedocument.spreadsheetml.sheet)>]}>
        # from django.core.files.uploadedfile import InMemoryUploadedFile
        print('request.data>>>>', request.data)
        default_password = request.data.get('default_password').strip()
        host_excel = request.data.get('host_excel')
        # 读取excel
        ## 方式1 将文件保存在本机上；然后读取excel文件
        ## 方式2 更快，讲文件呢数据存到byteio对象，内存字节流空间
        # if default_password:

        # host_excel = request.data.get('host_excel')
        # host_excel_bytes = host_excel.open(mode='rb')
        from io import BytesIO, StringIO
        # 创建一个excel的临时存储目录(根目录下创建tem_file)，先保存excel文件到本地，然后读取数据，保存，最后删除excel文件。
        # sio = StringIO()
        sio = BytesIO()
        # file_path = f'{settings.BASE_DIR}/tem_file/{host_excel.name}'
        # with open(file_path, 'wb') as f:
        for i in host_excel:
            sio.write(i)

        # res_data = read_host_excel_data(file_path, default_password)
        res_data = read_host_excel_data(sio, default_password)
        # 拿到上传之后的数据之后，我们删掉上传上来的临时excel文件

        # import os
        # if os.path.exists(file_path):  # 如果文件存在
        #     # 删除文件，可使用以下两种方法。
        #     os.remove(file_path)
        #     # os.unlink(path)
        # else:
        #     print('没有该文件:%s' % file_path)  # 则返回文件不存在

        return APIResponse(data=res_data)

    # 下载excel数据
    def get(self, request):
        # 1.读取数据库数据
        all_host_data = models.Host.objects.all().values('id', 'category', 'hostname', 'ip_addr', 'port', 'username',
                                                         'desc')
        print(all_host_data)

        # 2.写入excel并保存
        # 创建excel
        ws = xlwt.Workbook(encoding='utf-8')
        # 创建工作簿
        st = ws.add_sheet('主机数据')

        # 写标题行
        st.write(0, 0, 'id')
        st.write(0, 1, 'category')
        st.write(0, 2, 'hostname')
        st.write(0, 3, 'ip_addr')
        st.write(0, 4, 'port')
        st.write(0, 5, 'username')
        st.write(0, 6, 'desc')
        # st.write(0, 7, 'evrironments')

        # 写入数据，从第一行开始
        excel_row = 1
        for host_obj in all_host_data:
            st.write(excel_row, 0, host_obj.get('id'))
            st.write(excel_row, 1, host_obj.get('category'))
            st.write(excel_row, 2, host_obj.get('hostname'))
            st.write(excel_row, 3, host_obj.get('ip_addr'))
            st.write(excel_row, 4, host_obj.get('port'))
            st.write(excel_row, 5, host_obj.get('username'))
            st.write(excel_row, 6, host_obj.get('desc'))
            excel_row += 1
        # 将数据写入io数据流，不用在本地生成excel文件，不然效率就低了
        sio = BytesIO()
        ws.save(sio)
        sio.seek(0)

        # 3.将excel数据响应回客户端
        response = HttpResponse(sio.getvalue(), content_type='application/vnd.ms-excel')
        # 文件名称中文设置
        from django.utils.encoding import escape_uri_path
        response['Content-Disposition'] = 'attachment; filename={}'.format(escape_uri_path('主机列表数据.xls'))
        response.write(sio.getvalue())  # 必须要给response写入一下数据，不然不生效
        print(response)

        return response


class HostFileView(ViewSet):
    # 方法分发之前，先获取要操作的主机id和链接
    def dispatch(self, request, *args, **kwargs):
        pk = kwargs.get('pk')
        host_obj = models.Host.objects.filter(pk=pk).first()
        pkey = AppSetting.get('private_key')
        cli = host_obj.get_ssh(pkey)
        self.cli = cli
        ret = super(HostFileView, self).dispatch(request, *args, **kwargs)
        return ret

    @action(methods=['get'], detail=True)
    def get_folders(self, request, pk):
        cmd = request.query_params.get('cmd')
        res_code, res_data = self.cli.exec_command(cmd)
        return APIResponse(code=res_code, data=[res_data])

    # @action(methods=['post'], detail=False)
    # def download_file(self, request, pk, file_path):
    #     pass

    @action(methods=['post'], detail=True)
    def upload_file(self, request, pk):
        folder_path = request.query_params.get('folder_path')
        file_obj = request.FILES.get('file')
        folder_path += f'/{file_obj.name}'
        print(folder_path)
        file_size = file_obj.size

        try:
            self.cli.put_file_by_fl(file_obj, folder_path, self.file_upload_callback)
        except:
            return APIResponse(code=1, errors='文件上传失败,请联系管理员或者查看一下用户权限', status=status.HTTP_500_INTERNAL_SERVER_ERROR)

        return APIResponse()

    @action(methods=['delete'], detail=True)
    def delete_file(self, request, file_path):
        pass

    def file_upload_callback(self, n, k):
        print('>>>>>>>>>>>', n, k)

