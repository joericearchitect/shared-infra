DOCKER_MACHINE=$1 

echo .
echo .
echo ---- regenerating certs for this machine:  $DOCKER_MACHINE .....

docker-machine regenerate-certs  $DOCKER_MACHINE

echo ----   Complete

echo .
echo .
echo ---- active machine
docker-machine active

echo ---- list of all machines

docker-machine ls

echo .
echo .
