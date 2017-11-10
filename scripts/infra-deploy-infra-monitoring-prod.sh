# *********************************************************************************
# Description: provision a new docker host machine in AWS to be used for the wordpress blog
# Author:      Joe Rice
# Created:     10/14/2016
#
# Notes:
#    Script assumes that the following environment variables are set
#       export AWS_ACCESS_KEY=<Secret>
#       export AWS_SECRET_KEY=<Super_Top_Secret>
# *********************************************************************************

DIR="$(cd "$(dirname "$0")" && pwd)"

source $DIR/setenv.sh

cd $INFRA_MODULES_MONITORING_ANSIBLE_DIR

PLAYBOOK_FILE=./deploy-infra-monitoring-services-main.yml
EC2_INVENTORY_FILE=$INFRA_MODULES_DOCKER_SWARM_ANSIBLE_DIR/ec2-inventory/ec2.py
PLAYBOOK_VAR_ENV=prod
PLAYBOOK_VAR_DOMAIN_PREFIX=""
PLAYBOOK_VAR_DOMAIN_NAME=$JRA_DOMAIN_NAME
STACK_FILE_DIR=../docker
STACK_FILE_NAME=docker-compose.yml

cp $INFRA_MODULES_DOCKER_SWARM_ANSIBLE_DIR/ansible.cfg .

time ansible-playbook \
  -i $EC2_INVENTORY_FILE \
  -v \
  -u ubuntu \
  -e env=$PLAYBOOK_VAR_ENV \
  -e env_domain_prefix=$PLAYBOOK_VAR_DOMAIN_PREFIX \
  -e stack_file_dir=$STACK_FILE_DIR \
  -e stack_file_name=$STACK_FILE_NAME \
  --private-key $JRA_BUILD_PRIVATE_KEY_FILE $PLAYBOOK_FILE

rm ./ansible.cfg