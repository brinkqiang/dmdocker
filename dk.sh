#!/bin/bash
sudo service docker restart
sudo docker rmi -f dmgen-test:v1
sudo docker build -t dmgen-test:v1 .
sudo docker rmi -f $(sudo docker images -f "dangling=true" -q)
sudo docker run -it dmgen-test:v1 /bin/bash

