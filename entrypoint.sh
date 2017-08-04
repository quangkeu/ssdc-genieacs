#!/bin/bash
service mongod start
service mysql start
service redis-server start
service rabbitmq-server start
./opt/ssdc-genieacs/deploy_genieacs.sh
./home/ubuntu/execute_on_qa.sh webapp 
sleep 30
./home/ubuntu/execute_on_qa.sh backend 
while true; do sleep 1000; done
