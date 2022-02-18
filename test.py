# -*- coding: utf-8 -*-


import uuid

chars = ["A", "B", "C", "D", "E", "F", "G", "H", "I",
         "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
         "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5",
         "6", "7", "8", "9"]


def GenerateShortId():
    id = str(uuid.uuid4()).replace('-', '')
    buffer = []
    for i in range(0, 8):
        start = i * 4
        end = i * 4 + 4
        # 16转10进制
        val = int(id[start:end], 16)
        buffer.append(chars[val % 36])
    return "".join(buffer)

# print(GenerateShortId())

import os
xx = os.popen('git log --pretty="%h %an %s"')
print(xx.read())