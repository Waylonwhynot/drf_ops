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

li = [7, 5, 4, 6, 3, 8, 2, 9, 1]


# li = [1,2,3,4,5,6,7,8,9]

def CountSort(li):
    count = [0 for i in range(max(li) + 1)]
    for i in li:
        count[i] += 1
    li.clear()
    for n, num in enumerate(count):
        for x in range(num):
            li.append(n)

CountSort(li)
print(li)
