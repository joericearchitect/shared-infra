echo .
echo .
echo Removing all docker networks....

docker network rm $(docker network ls -q)

