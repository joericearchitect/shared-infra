
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

SWARM_MANAGER_NODE="$(infra-swarm-list-manager-ips.sh single)"

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo +  listing services using this manager node:
echo +   -   $SWARM_MANAGER_NODE
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ssh-aws.sh $SWARM_MANAGER_NODE "docker node ls"