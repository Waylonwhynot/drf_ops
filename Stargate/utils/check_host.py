# -*- coding: utf-8 -*-

from utils.ssh import SSH

def valid_ssh(hostname, port, username, password):
    ssh = SSH(hostname, port=port, username=username, password=password)
    try:
        ssh.ping()
    except Exception as e:
        return False
    return True
