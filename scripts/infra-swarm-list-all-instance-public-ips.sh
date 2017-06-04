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

SWARM_NODE_INFO=$(aws \
    ec2 describe-instances \
   --output text \
--query 'Reservations[*].Instances[*].PublicIpAddress')


if ! [ -z "$1" ]
then
 SWARM_NODE_INFO="$(echo $SWARM_NODE_INFO | cut -d ' ' -f2)"
fi

printf '%b\n' "$SWARM_NODE_INFO"
