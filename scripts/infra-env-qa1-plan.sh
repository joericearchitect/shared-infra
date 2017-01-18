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

export TERRAFORM_DIR=$INFRA_ENVIRONMENTS_HOME_DIR/high-availability
export ENVIRONMENT=qa1
export ENVIRONMENT_DOMAIN_PREFIX=qa1.

cd $TERRAFORM_DIR

terraform plan -var "environment=$ENVIRONMENT" -var "environment-domain-prefix=$ENVIRONMENT_DOMAIN_PREFIX"
