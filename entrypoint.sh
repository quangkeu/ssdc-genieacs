#!/bin/bash
service mongod restart
service mysql restart
service redis-server restart
service rabbitmq-server restart
./opt/ssdc-genieacs/deploy_genieacs.sh
sleep 5
./home/ubuntu/execute_on_qa.sh webapp 
sleep 30
./home/ubuntu/execute_on_qa.sh backend 
while true; do sleep 1000; done
