#!/bin/bash
service mongod start
service mysql start
service redis-server start
service rabbitmq-server start
#rabbitmqadmin -q import /opt/ssdc-genieacs/rabbit.config
./opt/ssdc-genieacs/deploy_genieacs.sh
./home/ubuntu/execute_on_qa.sh webapp $WEBAPP_NAME
sleep 30
./home/ubuntu/execute_on_qa.sh backend $BACKEND_NAME
while true; do sleep 1000; done
