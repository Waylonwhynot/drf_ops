# -*- coding: utf-8 -*-


# 报数的游戏 包含3的时候报A,5报B，同时包含35 报AB

import re

tmp_dict = {'A': 3, 'B': 5}

# # for i in range(100):
#
# i = 33
#
# if str(i) in str(3):
#     print("a")
# elif str(i) in str(5):
#     print("b")
# elif str(i) in str(35):
#     print("ab")
# elif str(i) in str(53):
#     print("ba")


# num  = "hello"
# tmp_list = []
# for i in num:
#     tmp_list.append(i)
# print(tmp_list)

# tmp_list = []
# end_str = ''
#
# for i in range(100):
#     tmp = re.search('[3|5]{1,}', str(i))
#     if tmp != None:
#         for j in tmp.group():
#             tmp_list.append(j)
#         for z in tmp_list:
#             if str(z) in str(3):
#                 end_str = end_str + 'A'
#             elif str(z) in str(5):
#                 end_str = end_str + "B"
#             else:
#                 continue
#         print(end_str)
#         end_str = ''
#         tmp_list = []
#     else:
#         print(i)


# for i in range(100):
#     print(i)
#     res = ""
#     while i > 0:
#         if (i % 10) == 3:
#             res += "A"
#         if (i % 10) == 5:
#             res += "B"
#         i //= 10
#     print(res)

a = "abcdef"

# list = ['a', 'b', 'c', 'd', 'e']
# print(list[10:])

# PEP8



# test = {{'A1': 12}, {'A1': 13}, {'A1': 14}}
# print(test)
#
# print(tmp.group(),tmp, type(tmp.group()))
#

# for i in tmp.group():
#     tmp_list.append(i)
# print(tmp_list)
# for j in tmp_list:
#     if j in str(3):
#         end_str = end_str + 'A'
#     elif j in str(5):
#         end_str = end_str + "B"
#     else:
#         pass
# print(end_str)

# str_tmp = str_tmp1 + str_tmp2
# print(str_tmp)

# tmp = re.search('[3|5]{1,}', str(i)


# if re.search('[3]{1,}', str(i)):
#     count_3 =
# elif re.search('[5]{1,}', str(i)):
#     print('B')
# elif re.search('[3,5]{1,}', str(i)):
