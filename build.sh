#!/bin/sh
if [ -z "$DOCKER_HOST" ]; then
  export DOCKER_HOST=tcp://192.168.59.103:2375
fi

tag=$1
if [ "$tag" == "auto" ];
then
  cat Docker > Dockerfile
  echo CMD [\"/opt/local/apache-cassandra-2.1.2/bin/init.sh\"] >> Dockerfile
  docker build -t skhatri/apache-cassandra:auto .
else
  cat Docker > Dockerfile
  docker build -t skhatri/apache-cassandra .
fi


