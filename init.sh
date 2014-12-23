#!/bin/sh
. $CASSANDRA_HOME/bin/ip.sh
cp $CASSANDRA_HOME/conf/cassandra.yaml.template $CASSANDRA_HOME/conf/cassandra.yaml
cat $CASSANDRA_HOME/conf/ip.txt >> $CASSANDRA_HOME/conf/cassandra.yaml
$CASSANDRA_HOME/bin/cassandra -f

