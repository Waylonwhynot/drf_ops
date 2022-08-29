# -*- coding: utf-8 -*-


# import uuid
#
# chars = ["A", "B", "C", "D", "E", "F", "G", "H", "I",
#          "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
#          "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5",
#          "6", "7", "8", "9"]
#
#
# def GenerateShortId():
#     id = str(uuid.uuid4()).replace('-', '')
#     buffer = []
#     for i in range(0, 8):
#         start = i * 4
#         end = i * 4 + 4
#         # 16转10进制
#         val = int(id[start:end], 16)
#         buffer.append(chars[val % 36])
#     return "".join(buffer)
#
# # print(GenerateShortId())
#
# import os
# xx = os.popen('git log --pretty="%h %an %s"')
# print(xx.read())

# n = input('请输入数字: ')

# n_reverse = n[::-1]

# new_integer = ''
# for i, c in enumerate(n_reverse):
#     print('i和c', i, '和', c)
#     if i > 0 and i % 3 == 0:
#         new_integer = new_integer + ',' + c
#     else:
#         new_integer += c
#
# print(new_integer[::-1])


# n = input('请输入数字: ')
# len_n = len(n)
# new_integer = ''
# new_integer1 = ''
# new_integer2 = ''
# flag = len_n % 3
# while flag > 0:
#     new_integer1 = n[flag-1]
#     tmp_integer2 = n[1::]
#     for i in tmp_integer2:
#         if tmp_integer2.index(i) % 3 == 0:
#             new_integer2 = new_integer2 + ',' + i
#         else:
#             new_integer2 += i
#     new_integer = new_integer1 + new_integer2
#     flag = 0
#
# print(new_integer)


# l = [1, 2, 3, 4, 5, 6, 7, 8, 9]
#
# for i,v in enumerate(l):
#     if i % 2 == 0:
#         print(i)


import os

old_str = 'https://gitee.com/waylon1006/blog_pic/raw/master'

new_str = 'https://cdn.jsdelivr.net/gh/Waylonwhynot/whatyouneed_blog_pic@main'

dir_path = '/Users/waylonyan/Desktop/blog/source/_drafts'


def read_file(file_path, name):
    count = 0
    file_data = ''
    with open(file_path, 'r') as f:
        for line in f:
            if old_str in line:
                line = line.replace(old_str, new_str)
                count += 1
            file_data += line
    print('--------文章：' + name + '------修改域名数量：' + str(count))
    replace_content(file_path, file_data)


def replace_content(file_path, file_data):
    with open(file_path, 'w') as f:
        f.write(file_data)


def get_all_files(path):
    files = os.listdir(path)
    print(files)
    for file_name in files:
        if file_name[-2:] == 'md':
            read_file(os.path.join(path, file_name), file_name)


if __name__ == '__main__':
    get_all_files(dir_path)
