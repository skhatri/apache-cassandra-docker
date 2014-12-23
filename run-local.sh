#!/bin/sh
if [ -z "$DOCKER_HOST" ]; then
  export DOCKER_HOST=tcp://192.168.59.103:2375
fi

docker run -i -e SEEDS=$(docker inspect `docker ps -a |grep 9160\-\>9160|awk '{print $1}'`|grep 172|grep IP|awk '{print $2}'|cut -d',' -f1|cut -d'"' -f2) -t skhatri/apache-cassandra
