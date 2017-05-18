FROM ubuntu:16.04
 
MAINTAINER Joe Rice
 
USER root

# https://wiki.alpinelinux.org/wiki/Docker
RUN apt-get update && apt-get install -y sudo 

RUN sudo apt-get install -y zip \
    && sudo apt-get install -y unzip \
    && sudo apt-get install -y curl \
    && sudo apt-get install -y wget \
    && sudo apt-get install git -y \
    && sudo apt-get install -y python-pip python-dev build-essential \
    && sudo pip install --upgrade pip  \
    && sudo pip install --upgrade virtualenv  \
    && sudo apt-get install software-properties-common -y \
    && sudo apt-add-repository ppa:ansible/ansible -y \
    && sudo apt-get install ansible -y \
    && sudo pip install boto \
    && sudo pip install boto3 \
    && sudo pip install docker \
    && sudo apt-get install sshpass
