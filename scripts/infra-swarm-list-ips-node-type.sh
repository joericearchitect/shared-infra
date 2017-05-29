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

SWARM_NODE_INFO=$(aws ec2 describe-instances --filters "Name=tag:jra.swarm-node-type,Values=$1"  \
  --output text \
--query 'Reservations[*].Instances[*].[PublicIpAddress, PrivateDnsName, PrivateIpAddress, PrivateDnsName]')

if ! [ -z "$2" ]
then
SWARM_NODE_INFO="$(echo $SWARM_NODE_INFO | cut -d ' ' -f5)"
echo "$SWARM_NODE_INFO"
else
	printf '%b\n' "\n---------------------------------------------------------------------------------------------------------------------------" \
"- returning public ip addresses for all instances of swarm-node-type = \"$1\"" \
"---------------------------------------------------------------------------------------------------------------------------\n"
printf '%b\n' "$SWARM_NODE_INFO\n"
fi
