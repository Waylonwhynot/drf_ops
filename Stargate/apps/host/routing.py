# -*- coding: utf-8 -*-
from channels.routing import ProtocolTypeRouter, ChannelNameRouter
# from consumer import routing, executors
from consumer import routing
# ProtocolTypeRouter 根据不同的请求协议，分发到不同的协议处理系统，如果是websocket协议，那么自动找routing.ws_router进行路由转发，如果是channel，那么通过executors.SSHExecutor路由进行转发，如果是http协议，那么还是按照之前的方式进行分发

application = ProtocolTypeRouter({
    'websocket': routing.ws_router
})
