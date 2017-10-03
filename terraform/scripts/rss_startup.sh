#!/bin/bash
cd

yum install -y epel-release ansible python-dnf libselinux-python git
yum update -y

gsutil cp gs://ml-rss-lasyk-info/rss-nginx_health_check.conf /etc/nginx/default.d/health_check.conf

git clone https://github.com/docent-net/rss.lasyk.info.git

cd ansible

ansible-playbook configure_server.yml