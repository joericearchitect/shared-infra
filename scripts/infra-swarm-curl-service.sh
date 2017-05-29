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
	$DIR/jra-util/jra-util-print-service-usage-info.sh $SCRIPT_NAME "<URL_TYPE>"
	exit 1;	
fi

SERVICE_NAME=$1

if ! [ -z "$2" ]
then
	URL_TYPE=$2
else
	URL_TYPE="domain"	
fi

SERVICE_MAIN_URL=$($DIR/infra-swarm-info-service-urls.sh $SERVICE_NAME $URL_TYPE)

printf '%b\n' ""
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo +  Attempting to curl the swarm service with the following info:
echo +   - Name of Service to curl:  $SERVICE_NAME
echo +   - Service main URL to curl:  $SERVICE_MAIN_URL
echo +   - URL Type:  $URL_TYPE
echo +
echo +  Command executed:  
echo +   - curl -X GET $SERVICE_MAIN_URL
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
printf '%b\n' ""

curl -X GET $SERVICE_MAIN_URL