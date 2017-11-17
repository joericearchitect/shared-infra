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

echo .
echo .
echo -------------------------------------------------------------
echo   Building Jarch Confluence Docker Image...
echo ------------------------------------------------

REPO_NAME=$JRA_GLOBAL_DOCKER_REPO_NAME
IMAGE_NAME=$JRA_GLOBAL_IMAGE_NAME_PREFIX_INFRA-confluence
IMAGE_VERSION=1.0.0
IMAGE_TAG_VERSION=$IMAGE_VERSION
IMAGE_TAG_LAGEST=latest

cd $INFRA_MODULES_CONFLUENCE_DOCKER_DIR/confluence

time docker build \
   -t $REPO_NAME/$IMAGE_NAME:$IMAGE_TAG_VERSION \
   -t $REPO_NAME/$IMAGE_NAME:$IMAGE_TAG_LAGEST \
   .

echo .
echo .
echo -------------------------------------------------------------
echo   Pushing Jarch Confluence Docker Image to Registry...
echo ------------------------------------------------

time docker push \
    $REPO_NAME/$IMAGE_NAME