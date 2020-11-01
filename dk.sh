#!/bin/bash

if [ -f /etc/redhat-release ]; then
    sudo yum -y install yum-utils
    sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
    sudo yum makecache fast
    sudo yum -y install docker-ce
    sudo systemctl restart docker
fi

if [ -f /etc/lsb-release ]; then
    curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] http://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt -y update
    sudo apt -y install docker-ce
    sudo apt -y install apt-transport-https ca-certificates curl software-properties-common
    sudo apt -y install python3 python3-pip
    pip3 install --user docker-compose
    sudo systemctl restart docker
fi

sudo docker pull centos
sudo docker rmi -f dmtimer-test:v1
sudo docker build -t dmtimer-test:v1 .
sudo docker run -it dmtimer-test:v1