class AuthMiddleware:
    # 加载路由时能够做一些事情
    def __init__(self, application):
        self.application = application
        print('AuthMiddleware>>>>>>', self.application)
        print(self)

    # ws请求来了之后，路径分发，自动触发的方法
    def __call__(self, scope):
        print('AuthMiddleware>>>>>>call方法执行了', scope)
        # scope中封装了本次请求的所有信息
        return self.application(scope)
