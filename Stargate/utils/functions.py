# -*- coding: utf-8 -*-

import json
import uuid
import arrow

uuidChars = [
    "A", "B", "C", "D", "E", "F", "G", "H", "I",
    "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
    "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5",
    "6", "7", "8", "9"
]


def GenerateShortId():
    sid = str(uuid.uuid4()).replace('-', '')
    buffer = []
    for i in range(0, 8):
        start = i * 4
        end = i * 4 + 4
        # 16转10进制
        val = int(sid[start:end], 16)
        buffer.append(uuidChars[val % 36])
    return "".join(buffer)

def bytes2json(data_bytes):
    data = data_bytes.decode('utf8').replace("'", '"')
    try:
        with open('/tmp/b.txt', mode='a', encoding='utf-8') as f:
            f.write(data)
    except Exception as e:
        print(e)
    return json.loads(data)


# 时间转东八区 alertmanager使用
def trans_time_utc(time):
    """
    :param time: 时间字符串
    :return: datetime.datetime 对象
    """
    return arrow.get(time).to('Asia/Shanghai').format('YYYY-MM-DD HH:mm:ss')


# datetime.timedelta 转换成 字符串 时分秒
def trans_timedelta(time):
    """
    :param time:  timedelta对象
    :return: str(0h 5min 00s)
    """
    tmp_time_str = str(time).split(':')
    return '%sh %smin %ss' % (tmp_time_str[0], tmp_time_str[1], tmp_time_str[2])


# 拼接prometheus告警信息
def makealertdata(status, alertType, eventLevel, eventService, eventMessage, hostname, startTime, recoveryTime=None,
                  alertTime=None, fingerprint=None, **kwargs):
    if status == 'firing':
        status_zh = '报警'
        title = '【%s】%s 正在报警' % (status_zh, alertType)
        send_data = {
            "msgtype": "markdown",
            "markdown": {
                "content": "## %s \n\n" % title +
                           ">**告警指纹**: %s \n\n" % fingerprint +
                           ">**告警级别**: %s \n\n" % eventLevel +
                           ">**告警业务**: %s \n\n" % eventService +
                           ">**告警类型**: %s \n\n" % alertType +
                           ">**告警主机**: %s \n\n" % hostname +
                           ">**告警详情**: %s \n\n" % eventMessage +
                           ">**告警状态**: %s \n\n" % status +
                           ">**触发时间**: %s \n\n" % startTime
            }
        }
    elif status == 'resolved':
        status_zh = '恢复'
        title = '【%s】  %s 报警恢复' % (status_zh, alertType)
        send_data = {
            "msgtype": "markdown",
            "markdown": {
                "content": "## %s \n\n" % title +
                           ">**告警指纹**: %s \n\n" % fingerprint +
                           ">**告警级别**: %s \n\n" % eventLevel +
                           ">**告警业务**: %s \n\n" % eventService +
                           ">**告警类型**: %s \n\n" % alertType +
                           ">**告警主机**: %s \n\n" % hostname +
                           ">**告警详情**: %s \n\n" % eventMessage +
                           ">**告警状态**: %s \n\n" % status +
                           ">**触发时间**: %s \n\n" % startTime +
                           ">**恢复时间**: %s \n" % recoveryTime +
                           ">**持续时间**: %s \n" % alertTime
            }
        }

    return send_data['markdown']['content']


# 拼接zabbix告警信息
def makezbxalertdata(status, hostname, eventName, IP, eventLevel, eventMessage, eventID, env, alert_type=None,
                     startTime=None, recoveryTime=None, alertTime=None):
    if status == 'alert':
        msg = "【故障产生】%s: %s\n告警主机：%s\n主机 IP：%s\n告警时间：%s\n告警等级：%s\n告警类型：%s\n告警信息：%s\n告警状态: %s\n事件ID:  %s\n环境: %s" % (
            hostname, eventName, hostname, IP, startTime, eventLevel, alert_type, eventName, eventMessage, eventID, env)
    else:
        msg = "【故障恢复】%s: %s\n告警主机：%s\n主机 IP：%s\n告警时间：%s\n恢复时间：%s\n持续时间：%s\n告警状态: %s\n事件ID:  %s\n环境: %s" % (
            hostname, eventName, hostname, IP, startTime, recoveryTime, alertTime, eventMessage, eventID, env)
    return msg