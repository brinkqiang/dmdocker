#!/bin/bash

sudo docker build -t dmgen-test:v1 .

sudo docker run -it dmgen-test:v1 /bin/bash
