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
    && sudo curl -fsSL https://test.docker.com/ | sh \
    && sudo usermod -aG docker ubuntu \
    && sudo apt-get install -y python \
    && sudo apt install -y python-pip \
    && sudo pip install docker

RUN sudo sudo wget https://raw.github.com/ansible/ansible/devel/contrib/inventory/ec2.py \
    && sudo mv ec2.py /etc/ansible \
    && sudo chmod +x /etc/ansible/ec2.py \
    && sudo wget https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.ini \
    && sudo mv ec2.ini /etc/ansible \
    && sudo curl -L https://releases.hashicorp.com/terraform/0.7.13/terraform_0.7.13_linux_amd64.zip >~/terraform_0.7.13_linux_amd64.zip \
    && sudo unzip ~/terraform_0.7.13_linux_amd64.zip -d /usr/local/bin 

RUN sudo curl -L https://releases.hashicorp.com/packer/0.12.0/packer_0.12.0_linux_amd64.zip >~/packer_0.12.0_linux_amd64.zip \
    && sudo unzip ~/packer_0.12.0_linux_amd64.zip -d /usr/local/bin \
    && wget https://s3.amazonaws.com/aws-cli/awscli-bundle.zip \
    && unzip awscli-bundle.zip \
    && sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws \
    && rm awscli-bundle.zip \
    && rm -r awscli-bundle \
    && sudo ln -s /home/vagrant/workspace/.aws /home/vagrant/.aws \
    && complete -C '/usr/local/aws/bin/aws_completer' aws \
    && curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - \
    && sudo apt-get install nodejs -y \
    && sudo add-apt-repository ppa:cwchien/gradle -y \
    && sudo apt-get install gradle -y
    
USER jenkins