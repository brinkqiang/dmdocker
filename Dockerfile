FROM centos:latest
MAINTAINER brinkqiang <brink.qiang@gmail.com>
LABEL name="dmgen Image"
LABEL vendor="brinkqiang"

RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
RUN curl -o /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
RUN yum clean all && yum makecache
RUN yum -y install yum-utils

RUN yum -y install git cmake gcc gcc-c++ autoconf libtool automake make 
RUN mkdir -p /home/myapp && cd /home/myapp
RUN git clone --progress --recursive -v "https://github.com/brinkqiang/dmtimer" && cd dmtimer && bash build.sh && cd ..
CMD pwd && cd /home/myapp/dmtimer/bin/relwithdebinfo && ./dmtimertest
