# -*- coding: utf-8 -*-
from host.serializer import HostModelSerializer
from host.models import HostCategory
import xlrd


def read_host_excel_data(host_excel_file_path, default_password=''):
    """
    params: SIO, default_password
    """
    # data = xlrd.open_workbook(本地文件路径)
    data = xlrd.open_workbook(file_contents=host_excel_file_path.getvalue())
    # 根据索引获取第一个sheet工作簿
    sheet = data.sheet_by_index(0)
    rows_count = sheet.nrows  # 数据行数
    # print(sheet.name, sheet.nrows, sheet.ncols) # sheet名称，行数，列数
    default_password = default_password

    # 查询出所有分类数据
    category_list = HostCategory.objects.values_list('id', 'name')
    # print(category_list)

    host_info_list = []
    for row_number in range(1, rows_count):
        one_row_dict = {}
        # print(sheet.cell(row_number, 0))  # 类型：值，  参数：(行号，列号)
        # print(sheet.cell_type(row_number, 0))  # 单元格数据类型
        # print(sheet.cell_value(row_number, 0)) # 获取值
        category = sheet.cell_value(row_number, 0)

        # 由于拿到的是分类名称，所以我们要找到对应名称的分类id，才能去数据库里面存储
        for category_data in category_list:
            # 如果数据库里有，就找到对应类型的id
            if category_data[1].strip() == category.strip():
                one_row_dict['category'] = category_data[0]
                break
            # 如果没有这个类型的数据，就创建这个类型的数据
            category_obj = HostCategory.objects.create(name=category.strip())
            one_row_dict['category'] = category_obj.id
            break

        # category_id = category
        # one_row_dict['category'] = category_id
        # 注意：数据列要对应
        one_row_dict['hostname'] = sheet.cell_value(row_number, 1)
        one_row_dict['ip_addr'] = sheet.cell_value(row_number, 2)
        one_row_dict['port'] = sheet.cell_value(row_number, 3)
        one_row_dict['username'] = sheet.cell_value(row_number, 4)

        # 如果该条记录中没有密码数据，那么使用用户填写的默认密码，如果默认密码也没有，那么报错
        # pwd = sheet.cell_value(row_number, 5)
        print(sheet.cell_value(row_number, 5), type(sheet.cell_value(row_number, 5)))
        excel_pwd = sheet.cell_value(row_number, 5)
        print('excel_pwd>>>>>>>', excel_pwd, type(excel_pwd))

        try:
            # pwd = str(int(excel_pwd))  # 这样强转容易报错，最好捕获一下异常，并记录单元格位置，给用户保存信息时，可以提示用户哪个单元格的数据有问题
            pwd = str(excel_pwd)
        except:
            pwd = default_password
        # 注意：应该提醒用户，密码列应该转换为字符串类型，也就是excel的文本
        if not pwd.strip():
            pwd = default_password
        one_row_dict['password'] = pwd
        # print(one_row_dict)

        one_row_dict['desc'] = sheet.cell_value(row_number, 6)

        host_info_list.append(one_row_dict)

    # 校验主机数据
    # 将做好的主机信息字典数据通过我们添加主机时的序列化器进行校验
    res_data = {}  # 存放上传成功之后需要返回的主机数据和某些错误信息数据
    serializers_host_res_data = []
    res_error_data = []
    for k, host_data in enumerate(host_info_list):
        s_obj = HostModelSerializer(data=host_data)
        # print(s_obj.is_valid())
        if s_obj.is_valid():
            new_host_obj = s_obj.save()

            serializers_host_res_data.append(new_host_obj)
        else:
            # 报错，并且错误信息中应该体验错误的数据位置
            res_error_data.append({'error': f'该{k + 1}行数据有误,其他没有问题的数据，已经添加成功了，请求失败数据改完之后，重新上传这个错误数据，成功的数据不需要上传了'})

    # 再次调用序列化器进行数据的序列化，返回给客户端
    s2_obj = HostModelSerializer(instance=serializers_host_res_data, many=True)
    # print(s2_obj.data)
    res_data['data'] = s2_obj.data
    res_data['error'] = res_error_data

    return res_data
