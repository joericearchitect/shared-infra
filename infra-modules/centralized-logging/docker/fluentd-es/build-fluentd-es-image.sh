echo .
echo .
echo -------------------------------------------------------------
echo   Building fluentD Docker ES Image...
echo ------------------------------------------------

REPO_NAME=tcjrice
IMAGE_NAME=tc-devops-poc-fluentd-es
IMAGE_VERSIN=1.0.0
IMAGE_TAG_VERSION=$IMAGE_VERSIN
IMAGE_TAG_LAGEST=latest

docker build \
   -t $REPO_NAME/$IMAGE_NAME:$IMAGE_TAG_VERSION \
   -t $REPO_NAME/$IMAGE_NAME:$IMAGE_TAG_LAGEST \
   .

docker push \
    $REPO_NAME/$IMAGE_NAME