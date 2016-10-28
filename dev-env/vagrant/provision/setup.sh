#!/bin/sh

#
# JRA Development Environment
#  VM Provision Script - This script will "provision" the dev environment VM by installing all prerequisits.
#  Note:  there may be other provisioners that run before or after this script.  Check the Vagrantfile.

echo "."
echo "*********************************************************************************
echo "   Provisioning wdpr dev environment virtual machine..."
echo "*********************************************************************************

echo "."
echo "*********************************************************************************
echo "   Setting up folder permissions..."
echo "*********************************************************************************
sudo chown -R vagrant:vagrant /home/vagrant/workspace

echo "."
echo "*********************************************************************************
echo "   updating apt-get"
echo "*********************************************************************************
sudo apt-get update -y > /dev/null

echo "."
echo "*********************************************************************************
echo "   Installing Git"
echo "*********************************************************************************
sudo apt-get install git -y > /dev/null

echo "."
echo "*********************************************************************************
echo "   Installing Maven"
echo "*********************************************************************************
sudo apt-get install maven -y > /dev/null
# for Maven, setting a new symbolic link so that maven points to the conf dir that is synced with host machine.
sudo rm /usr/share/maven/conf
sudo ln -s /home/vagrant/workspace/maven/conf /usr/share/maven/conf

echo "."
echo "*********************************************************************************
echo "   Settng symbolic link for git"
echo "*********************************************************************************
sudo ln -s /home/vagrant/workspace/git ~/git

echo "."
echo "*********************************************************************************
echo "   Installing Docker Machine"
echo "*********************************************************************************
sudo curl -L https://github.com/docker/machine/releases/download/v0.8.2/docker-machine-`uname -s`-`uname -m` >~/docker-machine 
sudo mv ~/docker-machine /usr/local/bin/docker-machine 
sudo chmod +x /usr/local/bin/docker-machine

echo "."
echo "*********************************************************************************"
echo "   Installing Amazon CLI - Command Line Interface "
echo "*********************************************************************************"
wget https://s3.amazonaws.com/aws-cli/awscli-bundle.zip
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
rm awscli-bundle.zip
rm -r awscli-bundle
sudo ln -s /home/vagrant/workspace/.aws /home/vagrant/.aws
complete -C '/usr/local/aws/bin/aws_completer' aws

echo "."
echo "*********************************************************************************
echo "   installing node.js
echo "*********************************************************************************
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y > /dev/null

echo "."
echo "*********************************************************************************
echo "   installing gradle
echo "*********************************************************************************
sudo add-apt-repository ppa:cwchien/gradle -y > /dev/null
sudo apt-get update -y > /dev/null 
sudo apt-get install gradle -y > /dev/null

echo "."
echo "*********************************************************************************
echo "   installing imagemagick
echo "*********************************************************************************
sudo apt-get install imagemagick -y > /dev/null

echo "."
echo "*********************************************************************************
echo "   installing PHP
echo "*********************************************************************************
sudo apt-get install build-essential libxml2-dev -y > /dev/null
#wget http://in1.php.net/distributions/php-5.3.29.tar.bz2
#wget http://in1.php.net/distributions/php-7.0.12.tar.bz2