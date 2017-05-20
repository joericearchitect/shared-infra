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
echo returning public ip addresses for all instances of swarm-node-type = "$1"

aws ec2 describe-instances --filters "Name=tag:jra.swarm-node-type,Values=$1"  \
  --output text \
  --query 'Reservations[*].Instances[*].[PublicIpAddress, PrivateIpAddress, PrivateDnsName]'
