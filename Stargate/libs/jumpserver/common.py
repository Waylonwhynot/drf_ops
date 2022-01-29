
import datetime
from httpsig.requests_auth import HTTPSignatureAuth
from Stargate.settings import JUMP_SERVER

class Connection():
    def __init__(self):
        self.server = JUMP_SERVER['SERVER']
        self.access_key = JUMP_SERVER['AK']
        self.secret_key = JUMP_SERVER['SK']


def get_jps_header():
    GMT_FORMAT = '%a, %d %b %Y %H:%M:%S GMT'
    header = {
        'X-JMS-ORG': '00000000-0000-0000-0000-000000000002',
        'Date': datetime.datetime.utcnow().strftime(GMT_FORMAT),
    }
    return header

def get_auth(access_key, secret_key):
    signature_headers = ['(request-target)', 'accept', 'date']
    auth = HTTPSignatureAuth(key_id=access_key, secret=secret_key, algorithm='hmac-sha256', headers=signature_headers)
    return auth