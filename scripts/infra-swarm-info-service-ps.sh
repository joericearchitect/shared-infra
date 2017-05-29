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

SCRIPT_NAME=`basename "$0"`

if [ -z "$1" ]
then
	$DIR/jra-util/jra-util-print-service-usage-info.sh $SCRIPT_NAME "<GREP_STRING>"
	exit 1;	
fi

GREP_STRING=""
GREP_STRING_DISPLAY=""
SERVICE_NAME=$1

SWARM_MANAGER_NODE="$(infra-swarm-list-manager-ips.sh single)"

if ! [ -z "$2" ]
then
	GREP_STRING=" | grep \"$2\""
	GREP_STRING_DISPLAY="grep $2";
else
	GREP_STRING=''
	GREP_STRING_DISPLAY="<no grep string>";
fi

printf '%b\n' ""
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo +  Listing tasks of service for following info:
echo +   - Executing on this Swarm Manager Node:  $SWARM_MANAGER_NODE
echo +   - Listing tasks for this service:  $SERVICE_NAME
echo +   - Using this grep string:   $GREP_STRING_DISPLAY
echo +
echo +  Command executed:  
echo +   - ssh-aws.sh $SWARM_MANAGER_NODE "docker service ps $SERVICE_NAME $GREP_STRING"
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
printf '%b\n' ""
ssh-aws.sh $SWARM_MANAGER_NODE "docker service ps  $SERVICE_NAME $GREP_STRING"
printf '%b\n' ""
