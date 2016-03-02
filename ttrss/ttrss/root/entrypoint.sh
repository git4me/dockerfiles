#!/bin/sh

if [ "$1" = "ttrss" ];then
    ansible-playbook -i /etc/ansible/hosts /etc/ansible/entrypoint.yml -c local
    exec s6-svscan /etc/s6/
fi

exec "$@"
