#!/bin/bash
#删除编译后的文件
rm -rf /home/code/lina/dist

# 更新代码
cd /home/code/lina && git stash && git pull

#编译
yarn install && yarn build


#拷贝文件
rm -rf /home/server/lina
mv /home/code/lina/dist /home/server/
mv /home/server/dist /home/server/lina
