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
echo "   updating apg-get"
echo "*********************************************************************************
sudo apg-get update -y > /dev/null

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

