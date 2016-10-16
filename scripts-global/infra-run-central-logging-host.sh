 # *********************************************************************************
# Description: provision a new docker host machine in AWS to be used for the wordpress blog
# Author:      Joe Rice
# Created:     10/14/2016
#
# Notes:
#    Script assumes that the following environment variables are set
#       export AWS_ACCESS_KEY_ID=<Secret>
#       export AWS_SECRET_ACCESS_KEY=<Super_Top_Secret>
# *********************************************************************************

DIR="$(cd "$(dirname "$0")" && pwd)"

source $DIR/setenv.sh

docker-machine create -d amazonec2 --amazonec2-vpc-id=vpc-64260003 --amazonec2-region us-east-1 --amazonec2-instance-type "t2.micro" $MACHINE_NAME_LOGGING_SERVER
 