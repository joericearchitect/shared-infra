echo .
echo .
echo Killing all docker containers....

docker kill $(docker ps -q)


echo .
echo .
echo Removing all docker containers....

docker rm $(docker ps -a -q)

