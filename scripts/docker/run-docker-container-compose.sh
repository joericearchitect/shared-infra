APP_NAME=$1
APP_CODE_DIR=$2
DOCKER_COMPOSE_FILE_NAME=$3

echo docker-cmp = $DOCKER_COMPOSE_FILE_NAME

cd $APP_CODE_DIR

if [ -z ${3+x} ]; then DOCKER_COMPOSE_FILE_NAME=docker-compose.yml; fi;


echo .
echo .

echo ---------------------------------------------------------------------------------------------
echo - Starting up containers with the follwoing compose files:
echo -   $APP_NAME   - $APP_CODE_DIR/$DOCKER_COMPOSE_FILE_NAME
echo ---------------------------------------------------------------------------------------------

docker-compose -f $APP_CODE_DIR/$DOCKER_COMPOSE_FILE_NAME up -d
