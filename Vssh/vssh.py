#!/usr/bin/env python
from fabric.api import *
from fabric.context_managers import *
from fabric.contrib.console import *

env.user = 'root'
env.hosts = ['host1','host2','host3']
env.passwords = {
		'root@host1': 'passwords',
		'root@host2': 'passwords',
		'root@host3': 'passwords'
		}
@runs_once
def input_raw():
	return prompt("Please input command:", default='hostname')

def workstask(command):
	run(command)

@task
def go():
	getcommand = input_raw()
	workstask(getcommand)
