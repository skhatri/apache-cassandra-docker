#!/bin/sh
IP_FILE=/opt/local/apache-cassandra-2.1.2/conf/ip.txt
LOCAL_IP=$(ifconfig eth0|grep addr:1|grep inet|awk '{print $2}'|cut -d':' -f2)

if [ -z "$SEEDS" ];
then
  SEED_IP=$LOCAL_IP
else
  SEED_IP=$SEEDS
fi


echo "rpc_address: $LOCAL_IP" > $IP_FILE
echo "broadcast_address: $LOCAL_IP" >> $IP_FILE
echo "listen_address: $LOCAL_IP" >> $IP_FILE

echo "seed_provider:                                                       
    - class_name: org.apache.cassandra.locator.SimpleSeedProvider            
      parameters:                                                               
          - seeds: \"$SEED_IP\"                    
" >> $IP_FILE
