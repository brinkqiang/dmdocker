FROM centos:latest
MAINTAINER brinkqiang <brink.qiang@gmail.com>
LABEL name="dmgen Image"
LABEL vendor="brinkqiang"
RUN yum -y install git && yum -y install cmake gcc gcc-c++ autoconf libtool automake make && cd home && mkdir myapp && cd myapp && git clone --progress --recursive -v "https://github.com/brinkqiang/dmgen" && cd dmgen && sh build.sh && cd ..
CMD pwd && cd /home/myapp/dmgen/bin && ./dmgen
