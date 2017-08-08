#!/bin/bash
service mongod restart
service mysql restart
sleep 5
mysql -uroot -proot -e "CREATE USER 'root'@'%' IDENTIFIED BY 'root';" 
mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';" 
mysql -uroot -proot -e "FLUSH PRIVILEGES;"
service redis-server restart
service rabbitmq-server restart
sleep 5
rabbitmqadmin -q import /home/ubuntu/ump-conf/rabbit.config
./home/ubuntu/ump-conf/deploy_genieacs.sh
sleep 5
./home/ubuntu/ump-conf/execute_on_qa.sh webapp 
sleep 10
.home/ubuntu/ump-conf/execute_on_qa.sh backend 
while true; do sleep 1000; done
