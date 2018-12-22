#!/bin/bash
sudo service docker restart
sudo docker rmi -f dmtimer-test:v1
sudo docker build -t dmtimer-test:v1 .
sudo docker rmi -f $(sudo docker images -f "dangling=true" -q)
sudo docker run -it dmtimer-test:v1 /bin/bash
