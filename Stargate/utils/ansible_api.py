import json
import shutil
from collections import namedtuple
from ansible.parsing.dataloader import DataLoader
from ansible.vars.manager import VariableManager
from ansible.inventory.manager import InventoryManager
from ansible.playbook.play import Play
from ansible.executor.task_queue_manager import TaskQueueManager
from ansible.plugins.callback import CallbackBase
from ansible.executor.playbook_executor import PlaybookExecutor
from ansible.utils.ssh_functions import check_for_controlpersist
import ansible.constants as C
import redis
import datetime
import logging, logging.handlers

ansible_remote_user = 'root'

class ResultCallback(CallbackBase):
    """一个简单的回调插件 """
    def v2_runner_on_ok(self, result, **kwargs):
        """打印结果的 json 表示形式 """
        host = result._host
        print(json.dumps({host.name: result._result}, indent=4, ensure_ascii=False))

def AnsibleApi(hosts, tasks, sources, extra_vars={}):
    Options = namedtuple('Options',
                         ['remote_user',
                          'connection',
                          'module_path',
                          'forks',
                          'become',
                          'become_method',
                          'become_user',
                          'check',
                          'diff'])
    options = Options(remote_user=ansible_remote_user,
                      connection='paramiko',
                      module_path=['/to/mymodules'],
                      forks=10,
                      become=None,
                      become_method=None,
                      become_user=None,
                      check=False,
                      diff=False)
    loader = DataLoader()
    passwords = dict(vault_pass='secret')
    inventory = InventoryManager(loader=loader, sources=sources)
    variable_manager = VariableManager(loader=loader, inventory=inventory)
    variable_manager.extra_vars=extra_vars
    play_source =  dict(name = "Ansible Play",hosts = hosts,gather_facts = 'no',tasks = tasks)
    play = Play().load(play_source, variable_manager=variable_manager, loader=loader)
    tqm = None
    try:
        tqm = TaskQueueManager(
                  inventory=inventory,
                  variable_manager=variable_manager,
                  loader=loader,
                  options=options,
                  passwords=passwords,
                  stdout_callback=ResultCallback(),
              )
        result = tqm.run(play)
    finally:
        if tqm is not None:
            tqm.cleanup()
        shutil.rmtree(C.DEFAULT_LOCAL_TMP, True)

class MyPlaybookExecutor(PlaybookExecutor):
    def __init__(self, playbooks, inventory, variable_manager, loader, options, passwords):
        self._playbooks = playbooks
        self._inventory = inventory
        self._variable_manager = variable_manager
        self._loader = loader
        self._options = options
        self.passwords = passwords
        self._unreachable_hosts = dict()
        if options.listhosts or options.listtasks or options.listtags or options.syntax:
            self._tqm = None
        else:
            self._tqm = TaskQueueManager(
                    inventory=inventory,
                    variable_manager=variable_manager,
                    loader=loader,
                    options=options,
                    passwords=self.passwords,
                    stdout_callback=ResultCallback()
                )
        check_for_controlpersist(C.ANSIBLE_SSH_EXECUTABLE)

def AnsiblePlaybookApi(playbooks, sources, extra_vars={}):
    Options = namedtuple('Options', [
        'remote_user',
        'connection',
        'module_path',
        'forks',
        'become',
        'become_method',
        'become_user',
        'check',
        'diff',
        'listhosts',
        'listtasks',
        'listtags',
        'syntax',
        ])
    options = Options(
        remote_user=ansible_remote_user,
        connection='paramiko',
        module_path=['/to/mymodules'],
        forks=10,
        become=None,
        become_method=None,
        become_user=None,
        check=False,
        diff=False,
        listhosts=None,
        listtasks=None,
        listtags=None,
        syntax=None
        )
    loader = DataLoader()
    passwords = dict(vault_pass='secret')
    inventory = InventoryManager(loader=loader, sources=sources)
    variable_manager = VariableManager(loader=loader, inventory=inventory)
    variable_manager.extra_vars=extra_vars
    pb = MyPlaybookExecutor(playbooks=playbooks,
                          inventory=inventory,
                          variable_manager=variable_manager,
                          loader=loader,
                          options=options,
                          passwords=passwords)
    result = pb.run()

if __name__ == '__main__':
    sources = 'scripts/inventory'
    extra_vars = {'content': '这个参数从外部传入'}
    # 测试 ansible_api
    tasks = []
    tasks.append(dict(action=dict(module='debug', args=dict(msg='{{ content}}'))))
    AnsibleApi("localhost", tasks, sources, extra_vars)
    # 测试 ansible-playbook_api
    playbooks = ['scripts/shell.yml',]
    AnsiblePlaybookApi(playbooks, sources, extra_vars)