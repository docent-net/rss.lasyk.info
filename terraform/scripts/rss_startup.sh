#!/bin/bash

yum install -y epel-release ansible python-dnf libselinux-python mariadb nginx
yum update -y

gsutil cp gs://ml-rss-lasyk-info/rss-nginx_health_check.conf /etc/nginx/default.d/health_check.conf

systemctl enable --now nginx