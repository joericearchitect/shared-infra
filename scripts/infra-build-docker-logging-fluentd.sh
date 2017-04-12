# *********************************************************************************
# Description: Builds a docker image for this node app
# Author:      Joe Rice
# Created:     10/14/2016
#
# Notes:
#    Uses the Dockerfile in this same git repo
# *********************************************************************************

DIR="$(cd "$(dirname "$0")" && pwd)"

source $DIR/setenv.sh

cd $INFRA_MODULES_LOGGING_DOCKER_DIR/fluentd-es-TEMP-DELETE

docker build -t $INFRA_LOGGING_FLUENTD_ES_IMAGE_NAME_LOCAL .

# **************************************************************************************
# Commenting out the tagging and pushing image to ECR repo is soooo slow.  Will add
# support for pushing images to repo when I set up the CI process with Jenkins
# **************************************************************************************
#docker tag $JARCH_WEB_STATIC_IMAGE_NAME_LOCAL $JARCH_WEB_STATIC_IMAGE_NAME_REPO
docker push $INFRA_LOGGING_FLUENTD_ES_IMAGE_NAME_REPO