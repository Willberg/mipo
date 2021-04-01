#!/bin/bash
# 删除上次的生成包
rm -rf /home/code/kunkka/target

# 更新代码
cd /home/code/kunkka && git stash && git pull

# 拷贝配置文件
cp /home/resource/kunkka/application.yml /home/code/kunkka/src/main/resources
cp /home/resource/kunkka/40001/logback-spring.xml /home/code/kunkka/src/main/resources

# mvn打包和拷贝
mvn package -Dmaven.test.skip=true
cp /home/code/kunkka/target/kunkka-1.0.0.jar /home/server/kunkka-40001.jar

# 拷贝配置文件
cp /home/resource/kunkka/application.yml /home/code/kunkka/src/main/resources
cp /home/resource/kunkka/40002/logback-spring.xml /home/code/kunkka/src/main/resources

# mvn打包和拷贝
mvn package -Dmaven.test.skip=true
cp /home/code/kunkka/target/kunkka-1.0.0.jar /home/server/kunkka-40002.jar

# 将上次启动的kunkka实例杀掉
for pid in `ps -ef | grep kunkka | grep java | grep -v grep | awk '{print $2}'`;do
	echo 'killing '$pid
	kill -9 $pid
done

# 启动两个实例
nohup java -jar /home/server/kunkka-40001.jar --server.port=40001 &
nohup java -jar /home/server/kunkka-40002.jar --server.port=40002 &
