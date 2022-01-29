import os

env = os.environ.get('environment', None)

if env and env == 'PRD':
    from .pro import *
else:
    from .dev import *