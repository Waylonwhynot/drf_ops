
import time

from ..http_util import HTTP
from .common import get_jps_header, get_auth
from .common import Connection

class Base():
    connection = Connection()
    HTTP.server = connection.server
    header = get_jps_header()
    HTTP.get_header(header)
    HTTP.auth = get_auth(connection.access_key, connection.secret_key)
    
class User(Base):
    def __init__(self):
        self.uri = '/api/v1/users/users/'
        self.id = None
        self.name = None
        self.username = None
        self.email = None
    
    def exist(self):
        params = {'username': self.username}
        res = HTTP.get(self.uri, params=params)
        res_data = res.json()
        if res.status_code in [200, 201] and res_data:
            self.id = res_data[0].get('id')
        else:
            self.create()

    def create(self):
        data = {
            'name': self.name,
            'username': self.username,
            'email': self.email,
            'is_active': True
        }
        res = HTTP.post(self.uri, json=data)
        self.id = res.json().get('id')

    def perform(self):
        self.exist()

class Node(Base):
    def __init__(self):
        self.uri = '/api/v1/assets/nodes/'
        self.id = None
        self.name = None
    
    def exist(self):
        params = {'value': self.name}
        res = HTTP.get(self.uri, params=params)
        res_data = res.json()
        if res.status_code in [200, 201] and res_data:
            self.id = res_data[0].get('id')
        else:
            self.create()
    
    def create(self):
        data = {
            'value': self.name
        }
        res = HTTP.post(self.uri, json=data)
        self.id = res.json().get('id')
    
    def perform(self):
        self.exist()

class Domain(Base):
    def __init__(self):
        self.uri = ''
        self.id = None
        self.name = None

    def exist(self):
        params = {'name': self.name}
        res = HTTP.get(self.uri, params=params)
        res_data = res.json()
        if res.status_code in [200, 201] and res_data:
            self.id = res_data[0].get('id')
        else:
            self.create()

    def create(self):
        data = {
            'name': self.name
        }
        res = HTTP.post(self.uri, json=data)
        self.id = res.json().get('id')

    def perform(self):
        self.exist()

class AdminUser(Base): 
    """
    特权用户
    """    
    def __init__(self):
        self.uri = '/api/v1/assets/admin-user/'
        self.id = None
        self.name = None
    
    def exist(self):
        params = {'username': self.name}
        res = HTTP.get(self.uri, params=params)
        res_data = res.json()
        if res.status_code in [200, 201] and res_data:
            self.id = res_data[0].get('id')

class SystemUser(Base):
    """
    系统用户
    """    
    def __init__(self):
        self.uri = '/api/v1/assets/system-users/'
        self.id = None
        self.name = None
        self.username = None

    def exist(self):
        params = {'name': self.name}
        res = HTTP.get(self.uri, params)
        res_data = res.json()
        if res.status_code in [200, 201] and res_data:
            self.id = res_data[0].get('id')
        else:
            self.create()

    def create(self):
        data = {
            'name': self.name,
            'username': self.username,
            'login_mode': 'auto',
            'protocol': 'ssh',
            'auto_push': True,
            'sudo': 'All',
            'shell': '/bin/bash',
            'auto_generate_key': True,
            'is_active': True
        }
        res = HTTP.post(self.uri, json=data)
        self.id = res.json().get('id')

    def perform(self):
        self.exist()

class Asset(Base):
    """
    资产
    """    
    def __init__(self, hostname, ip, platform, **kwargs):
        self.uri = '/api/v1/assets/assets/'
        self.id = None
        self.hostname = hostname
        self.ip = ip
        self.platform = platform
        self.kwargs = kwargs
        self.data = None
        self.status = False
    
    def exist(self):
        params = {
            'ip': self.ip
        }
        res = HTTP.get(self.uri, params)
        res_data = res.json()
        if res.status_code in [200, 201] and res_data:
            self.status = True
            self.data = res_data[0]
            self.id = res_data[0].get('id')
            return res_data

    def update(self):
        self.exist()
        url = f'{self.uri}{self.id}/'
        self.data.update(self.kwargs)
        # data = {
        #     'hostname': self.hostname,
        #     'ip': self.ip,
        #     'platform': self.platform,
        #     'protocols': [f"{self.kwargs.get('protocols')}/{self.kwargs.get('port')}"],
        #     'is_active': self.kwargs.get('is_active') if 'is_active' in self.kwargs.keys() else True
        # }
        res = HTTP.put(url, json=self.data)
        return res.json()

    def patch(self, data):
        self.exist()
        url = f'{self.uri}{self.id}/'
        res = HTTP.patch(url, json=data)
        return res.json()

    def create(self):
        data = {
            'hostname': self.hostname,
            'ip': self.ip,
            'platform': self.platform,
            'protocols': [f"{self.kwargs.get('protocols')}/{self.kwargs.get('port')}"],
            'admin_user': self.kwargs.get('admin_user') if 'admin_user' in self.kwargs.keys() else None,
            'domain': self.kwargs.get('domain') if 'domain' in self.kwargs.keys() else None,
            'is_active': self.kwargs.get('is_active') if 'is_active' in self.kwargs.keys() else True,
            'comment': "Create by Stargate"
        }
        res = HTTP.post(self.uri, json=data)
        self.id = self.data.get('id')
        return res.json()

    def delete(self):
        self.exist()
        url = f'{self.uri}{self.id}/'
        res = HTTP.delete(url)
        if res.status_code == 204:
            self.status = True

    def get_or_create(self):
        self.exist()
        if not self.status:
            self.create()

        

class AssetPermission(Base):

    def __init__(self):
        self.uri = '/api/v1/perms/asset-permissions/'
        self.name = None
        self.user = User()
        self.asset = Asset()
        self.system_user = SystemUser()

    def create(self):
        perm_date_start = time.strftime("%Y-%m-%d %H:%M:%S %z", time.localtime())
        perm_date_expired = time.strftime("%Y-%m-%d %H:%M:%S %z", time.localtime(time.time() + 365*24*60*60*2))
        data = {
            'name': self.name,
            'users': [self.user.id],
            'assets': [self.asset.id],
            'system_users': [self.system_user.id],
            'actions': ['all'],
            'is_active': True,
            'date_start': perm_date_start,
            'date_expired': perm_date_expired
        }
        res = HTTP.post(self.uri, json=data)
        res_data = res.json()
        if res.status_code in [200, 201] and res_data:
            print("创建资产授权规则成功: ", res_data)
        else:
            print("创建授权规则失败: ", res_data)

    def perform(self, name, username, assets, system_user):
        """
         @description: 资产授权
         @param name: 资产授权名称
         @param username: 用户账号名称
         @param assets: 资产IP
         @param system_user: 资产登录帐户
         @return {*}
        """        
        self.user.username = username
        self.user.perform()
        self.asset.ip = assets
        self.asset.get_create()
        self.system_user.name = system_user
        self.system_user.perform()
        self.name = name
        self.create()