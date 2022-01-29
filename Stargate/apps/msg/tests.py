from django.test import TestCase

# Create your tests here.
import os

if __name__ == "__main__":
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "Stargate.settings")
    # import django
    # django.setup()
    # from Stargate.common.wechat import WeChatApp
    # wechat = WeChatApp(corpid='wwdd1c5dbd0657ead3', corpsecret='AMxZ91sZwB3_aZBBgV9GDbyQZ6XWmCNVRFE3ZPxfW_k', agentid='1000026')
    # wechat.send_msg(username='YanWenLiang', msg='测试消息', msgtype='text')
    import uuid
    print(uuid.uuid4())
