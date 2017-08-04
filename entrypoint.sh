#!/bin/bash
service mongod start
service mysql start
service redis-server start
service rabbitmq-server start
#rabbitmqadmin -q import /opt/ssdc-genieacs/rabbit.config
./opt/ssdc-genieacs/deploy_genieacs.sh
./home/ubuntu/execute_on_qa.sh $1 $2
while true; do sleep 1000; done
