# -*- coding: utf-8 -*-


import os
if __name__ == "__main__":
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'Stargate.settings.dev')       # 这是manage.py文件中拷贝的
    import django
    django.setup()
    from collections import OrderedDict

    from django.http import JsonResponse

    d = OrderedDict([('a', 1), ('b', 2), ('c', 3)])
    print(d)
    e = OrderedDict([('e', 5)])

    d.setdefault('children', []).append(e)
    print(d)

    print(JsonResponse(d).content)