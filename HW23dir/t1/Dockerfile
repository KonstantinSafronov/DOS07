FROM ubuntu:20.04

RUN apt-get update

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Moscow
RUN apt-get install -y tzdata

RUN apt-get install python3-pip -y && \
pip3 install ansible

RUN apt-get install -y ssh && \
apt-get install -y openssh-server

RUN apt-get install -y iputils-ping && \
mkdir /AnsibleDir

RUN apt-get install -y net-tools nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
ENTRYPOINT service nginx restart
ENTRYPOINT service ssh restart

WORKDIR /AnsibleDir
