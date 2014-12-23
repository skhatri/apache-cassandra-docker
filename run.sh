#!/bin/sh
if [ -z "$DOCKER_HOST" ]; then
  export DOCKER_HOST=tcp://192.168.59.103:2375
fi

docker run -d -p 9160:9160 -p 9042:9042 -t skhatri/apache-cassandra:auto

