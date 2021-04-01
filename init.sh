#!/usr/bin/env bash
# 建立相关目录
mkdir -p /home/build
mkdir -p /home/logs/kunkka
mkdir -p /home/server
mkdir -p /home/code
mkdir -p /home/logs/kunkka/40001
mkdir -p /home/logs/kunkka/40002

# 克隆代码
cd /home/code && git clone https://github.com/Willberg/kunkka.git
cd /home/code && git clone https://github.com/Willberg/lina.git

# 拷贝kunkka配置
mv -r resource /home

#拷贝nginx配置
mv conf/nginx.conf /home/server/nginx/conf

# 启动nginx
nginx