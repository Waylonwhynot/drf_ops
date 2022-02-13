# -*- coding: utf-8 -*-
from functools import lru_cache
from host.models import PkeyModel

class AppSetting:
    keys = ('public_key', 'private_key')

    # 由于经常执行get操作，所以适用了Django的缓存机制，对方法的结果进行缓存，第二次调用get方法就走缓存
    @classmethod
    @lru_cache(maxsize=64)
    def get(cls, key):
        info = PkeyModel.objects.filter(key=key).first()
        if not info:
            raise KeyError(f'没有这个 {key!r}')
        return info.value

    @classmethod
    # 添加公钥或者私钥
    def set(cls, key, value, desc=None):
        if key in cls.keys:
            PkeyModel.objects.update_or_create(key=key, defaults={'value': value, 'desc': desc})
        else:
            raise KeyError('key数据不正常')
