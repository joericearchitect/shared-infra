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
#!/bin/bash


if [ -z "$1" ]
then
    echo .
    echo You must pass in a private dns name to look up
    exit 1;	
fi


echo returning public ip address for this private dns name = "$1"

SWARM_NODE_INFO="$(infra-swarm-list-swarm-manager-ips.sh)"
SWARM_NODE_INFO="$(echo $SWARM_NODE_INFO | cut -d ' ' -f1)"


SWARM_MANAGER_HOST_INFO="$(\
    aws ec2 describe-instances \
    --filters Name=private-dns-name,Values=$1* \
    --output json \
    --query 'Reservations[*].Instances[*].{PublicIpAddress:PublicIpAddress, PrivateIpAddress:PrivateIpAddress,PublicDnsName:PublicDnsName,PrivateDnsName:PrivateDnsName,Tags:Tags[?Key==`jra.swarm-node-type` || Key==`Name` || Key==`jra.swarm-instance-type` || Key==`jra.failure-zone` || Key==`jra.environment_type`]}' \
 | jq 'type,length'
  )"  

declare -A SWARM_NODE_INFO_MAP

SWARM_NODE_INFO_MAP[PublicIpAddress]="$(echo $SWARM_MANAGER_HOST_INFO | cut -d ' ' -f1)"
SWARM_NODE_INFO_MAP[PrivateIpAddress]="$(echo $SWARM_MANAGER_HOST_INFO | cut -d ' ' -f2)"
SWARM_NODE_INFO_MAP[PrivateIHostName]="$(echo $SWARM_MANAGER_HOST_INFO | cut -d ' ' -f4 | cut -d '.' -f1)"
SWARM_NODE_INFO_MAP[PublicHostName]="$(echo $SWARM_MANAGER_HOST_INFO | cut -d ' ' -f3 | cut -d '.' -f1)"
SWARM_NODE_INFO_MAP[PublicDnsName]="$(echo $SWARM_MANAGER_HOST_INFO | cut -d ' ' -f3)"
SWARM_NODE_INFO_MAP[PrivateDnsName]="$(echo $SWARM_MANAGER_HOST_INFO | cut -d ' ' -f4)"
SWARM_NODE_INFO_MAP[Name]="$(echo $SWARM_MANAGER_HOST_INFO | cut -d ' ' -f5)"
SWARM_NODE_INFO_MAP[SwarmNodeType]="$(echo $SWARM_MANAGER_HOST_INFO | cut -d ' ' -f6)"
SWARM_NODE_INFO_MAP[SwarmInstanceType]="$(echo $SWARM_MANAGER_HOST_INFO | cut -d ' ' -f7)"
SWARM_NODE_INFO_MAP[FailureZone]="$(echo $SWARM_MANAGER_HOST_INFO | cut -d ' ' -f8)"
SWARM_NODE_INFO_MAP[Environment]="$(echo $SWARM_MANAGER_HOST_INFO | cut -d ' ' -f9)"

STRING=""

STRING=$(for i in "${!SWARM_NODE_INFO_MAP[@]}"
do
  echo $"  - $i - ${SWARM_NODE_INFO_MAP[$i]}"
done|
sort -k1 | column -t)

echo .
echo ---------------------------------------------------------------------------------------------------------------------------------------
printf '%b\n' "$SWARM_NODE_INFO_MAP" | column -t
echo ---------------------------------------------------------------------------------------------------------------------------------------



