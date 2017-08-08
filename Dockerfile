FROM 10.84.20.62:8082/admin/ump-runtime

MAINTAINER QuangNL

RUN apt-get install -y ca-certificates-java && update-ca-certificates -f

RUN mkdir -p /home/ubuntu/DeployGenieacs/logs
COPY /ump-conf /home/ubuntu/ump-conf
COPY /ump-backend /tmp/ump-backend
RUN mkdir -p /home/ubuntu/DeployGenieacs/logs
RUN cd /home/ubuntu/ump-conf \
&& tar -xzf genieacs.tar.gz \
&& mv genieacs /home/ubuntu/ 

RUN chmod +x /home/ubuntu/ump-conf/deploy_genieacs.sh \
&& chmod +x /home/ubuntu/ump-conf/execute_on_qa.sh \
&& chmod +x /home/ubuntu/ump-conf/entrypoint.sh

CMD ["./home/ubuntu/ump-conf/entrypoint.sh"]

EXPOSE 8080
