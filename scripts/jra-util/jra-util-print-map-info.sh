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

INFO_MAP=$1

STRING=""

STRING=$(for i in "${!INFO_MAP[@]}"
do
echo $"$i ${INFO_MAP[$i]}"
done|
sort -k1 | column -t)

printf '%b\n' "$STRING" | column -t



