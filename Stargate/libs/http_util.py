
import requests
from rest_framework.exceptions import APIException

class HTTP():
    """
    封装HTTP请求
    """    
    server = None
    auth = None
    header = None

    @classmethod
    def get_header(cls, header=None):
        """
        获取header
        """        
        headers = {
            'Accept': 'application/json',
        }
        if header:
            headers.update(header)
        cls.header = headers

    @classmethod
    def get_auth(cls, auth=None):
        """
        获取auth信息，如果需要auth信息
        """        
        cls.auth = auth

    @classmethod
    def run_request(cls, method, url, params=None, data=None, json=None, **kwargs):
        """
        内部执行request请求
        """        
        try:
            res = requests.request(method=method, url=url, params=params, json=json, data=data, **kwargs)
            return res
        except requests.exceptions.HTTPError as http_error:
            raise APIException(f"远程http状态异常, url: {url} method: {method} msg: {http_error}") 
        except requests.exceptions.Timeout as timeout_error:
            raise APIException(f"远程http请求超时, url: {url} method: {method} msg: {timeout_error}")
        except requests.exceptions.ConnectionError as connect_error:
            raise APIException(f"远程网络连接异常, url: {url} method: {method} msg: {connect_error}")
        except requests.exceptions.RequestException as request_error:
            raise APIException(f"远程网络请求异常, url: {url} method: {method} msg: {request_error}")

    @classmethod
    def get(cls, uri, params=None, **kwargs):
        """
        request get请求
        """        
        url = cls.server + uri
        kwargs['auth'] = cls.auth
        kwargs['headers'] = cls.header
        res = cls.run_request("GET", url, params=params, **kwargs)
        return res

    @classmethod
    def post(cls, uri, data=None, json=None, **kwargs):
        """
        request post请求
        """        
        url = cls.server + uri
        kwargs['auth'] = cls.auth
        kwargs['headers'] = cls.header
        res = cls.run_request("POST", url, data=data, json=json, **kwargs)
        return res
    
    @classmethod
    def put(cls, uri, data=None, json=None, **kwargs):
        """
        request put请求
        """        
        url = cls.server + uri
        kwargs['auth'] = cls.auth
        kwargs['headers'] = cls.header
        res = cls.run_request("PUT", url, data=data, json=json, **kwargs)
        return res
    
    @classmethod
    def patch(cls, uri, data=None, json=None, **kwargs):
        """
        request patch请求
        """        
        url = cls.server + uri
        kwargs['auth'] = cls.auth
        kwargs['headers'] = cls.header
        res = cls.run_request("PATCH", url, data=data, json=json, **kwargs)
        return res

    @classmethod
    def delete(cls, uri, params=None, **kwargs):
        """
        request delete请求
        """        
        url = cls.server + uri
        kwargs['auth'] = cls.auth
        kwargs['headers'] = cls.header
        res = cls.run_request("DELETE", url, params=params, **kwargs)
        return res
