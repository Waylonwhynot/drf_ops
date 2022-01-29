
# Create your tests here.

import os
import sys
sys.path.append('/root/stargate/')

if __name__ == "__main__":
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "Stargate.settings")
    import django
    django.setup()
    from Stargate.libs.jumpserver import runner
    data = {
        'protocols': [f"ssh/3389"],
        # 'port': '3389',
        'is_active': True
    }
    a = runner.Asset('demo', '127.0.0.1', 'Linux', **data)
    res = a.update()
    print(res)
    