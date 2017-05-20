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
echo returning public ip address for this private dns name = "$1"
aws ec2 describe-instances --filters "Name=private-dns-name,Values=$1*" --output text --query 'Reservations[*].Instances[*].PublicIpAddress'
