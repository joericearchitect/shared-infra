DOCKER_MACHINE_TO_SWITCH=$1 

echo .
echo .
echo ---- Making this machine active:  $DOCKER_MACHINE_TO_SWITC .....

 eval "$(docker-machine env $DOCKER_MACHINE_TO_SWITCH)"

echo ----   Complete

echo .
echo .
echo ---- active machine
docker-machine active

echo ---- list of all machines

docker-machine ls

echo .
echo .
