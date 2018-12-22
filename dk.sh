#!/bin/bash
sudo yum -y install docker
sudo service docker restart
sudo docker pull centos
sudo docker rmi -f dmtimer-test:v1
sudo docker build -t dmtimer-test:v1 .
sudo docker run -it dmtimer-test:v1
