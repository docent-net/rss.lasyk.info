#!/bin/bash

yum install -y epel-release ansible libselinux-python git
yum update -y

gsutil cp gs://ml-rss-lasyk-info/rss-nginx_health_check.conf /etc/nginx/default.d/health_check.conf

cd /root

git clone https://github.com/docent-net/rss.lasyk.info.git /root/rss.lasyk.info

cd /root/rss.lasyk.info/ansible

ansible-playbook configure_server.yml