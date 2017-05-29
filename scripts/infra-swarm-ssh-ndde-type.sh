
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
echo +  ssh into this manager node:
echo +   -   $SWARM_MANAGER_NODE
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ssh-aws.sh $SWARM_MANAGER_NODE "$1"


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
if [ -z "$1" ]
then
    echo .
    echo You must pass in a private dns name to look up
    exit 1;	
fi

SWARM_NODE="$(infra-swarm-list-ips-node-type.sh $1 single)"

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo +  ssh into this node found for this node type:  :
echo +   -   $SWARM-NODE
echo +  
echo +  found for this node type:  :
echo +   -   $1
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ssh-aws.sh $SWARM_NODE "$2"
