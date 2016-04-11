#!/bin/bash

if ! ls /etc/ssh/ssh_host_* 1> /dev/null 2>&1; then
    ssh-keygen -A
fi

/usr/sbin/sshd -D -f /etc/ssh/sshd_config
