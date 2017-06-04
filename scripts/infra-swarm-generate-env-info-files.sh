DIR="$(cd "$(dirname "$0")" && pwd)"

source $DIR/setenv.sh

SOURCE_RESPONSE_FILES_DIR=$DIR/../infra-applications/jra-infra-rest-api/source-response-examples

if ! [ -z "$1" ]
then
	SWARM_NODE_INFO="$(echo $SWARM_NODE_INFO | cut -d ' ' -f5)"
	echo "$SWARM_NODE_INFO"
fi

echo +++++++
echo + preparing folders
echo +++++++

sudo mkdir -p $SOURCE_RESPONSE_FILES_DIR
sudo mkdir -p $SOURCE_RESPONSE_FILES_DIR/backup

sudo mv $SOURCE_RESPONSE_FILES_DIR/* $SOURCE_RESPONSE_FILES_DIR/backup

echo +++++++
echo + get swarm system details
echo +++++++
infra-swarm-ssh-manager.sh "docker system info --format '{{json .}}'" > $SOURCE_RESPONSE_FILES_DIR/source-docker-swarm-system-info-response.json
infra-swarm-ssh-manager.sh "docker system info" > $SOURCE_RESPONSE_FILES_DIR/source-docker-swarm-system-info-response.txt

echo +++++++
echo + get list of swarm nodes
echo +++++++
infra-swarm-ssh-manager.sh "docker node ls --format '{{json .}}'" > $SOURCE_RESPONSE_FILES_DIR/source-docker-swarm-node-ls-response.json
infra-swarm-ssh-manager.sh "docker node ls" > $SOURCE_RESPONSE_FILES_DIR/source-docker-swarm-node-ls-response.txt

SWARM_NODE_HOSTNAMES=$(echo $(infra-swarm-ssh-manager.sh "docker node ls --format '{{.Hostname}}'"))

echo ++++++
echo + Get node processes for swarm nodes:
echo + .. $SWARM_NODE_HOSTNAMES
echo +++++++
infra-swarm-ssh-manager.sh "docker node ps $SWARM_NODE_HOSTNAMES --format '{{json .}}'" > $SOURCE_RESPONSE_FILES_DIR/source-docker-swarm-node-ps-response.json
infra-swarm-ssh-manager.sh "docker node ps $SWARM_NODE_HOSTNAMES" > $SOURCE_RESPONSE_FILES_DIR/source-docker-swarm-node-ps-response.txt

echo ++++++-+
echo + Get node details for swarm nodes:
echo + .. $SWARM_NODE_HOSTNAMES
echo +++++++
infra-swarm-ssh-manager.sh "docker node inspect $SWARM_NODE_HOSTNAMES" > $SOURCE_RESPONSE_FILES_DIR/source-docker-swarm-node-inspect-response.json
infra-swarm-ssh-manager.sh "docker node inspect $SWARM_NODE_HOSTNAMES --pretty" > $SOURCE_RESPONSE_FILES_DIR/source-docker-swarm-node-inspect-response.txt

echo ++++++
echo + Get service list
echo +++++++

infra-swarm-ssh-manager.sh "docker service ls --format '{{json .}}'" > $SOURCE_RESPONSE_FILES_DIR/source-docker-swarm-service-ls-response.json
infra-swarm-ssh-manager.sh "docker service ls" > $SOURCE_RESPONSE_FILES_DIR/source-docker-swarm-service-ls-response.txt

SWARM_SERVICE_NAMES=$(echo $(infra-swarm-ssh-manager.sh "docker service ls --format '{{.Name}}'"))
 
echo ++++++
echo + Get service processes for swarm servcies:
echo + .. $SWARM_SERVICE_NAMES
echo +++++++

infra-swarm-ssh-manager.sh "docker service ps $SWARM_SERVICE_NAMES --format '{{json .}}'" > $SOURCE_RESPONSE_FILES_DIR/source-docker-swarm-service-ps-response.json
infra-swarm-ssh-manager.sh "docker service ps $SWARM_SERVICE_NAMES" > $SOURCE_RESPONSE_FILES_DIR/source-docker-swarm-service-ps-response.txt

echo ++++++
echo + Get service details for swarm servcies:
echo + .. $SWARM_SERVICE_NAMES
echo +++++++

infra-swarm-ssh-manager.sh "docker service inspect $SWARM_SERVICE_NAMES" > $SOURCE_RESPONSE_FILES_DIR/source-docker-swarm-service-inspect-response.json
infra-swarm-ssh-manager.sh "docker service inspect $SWARM_SERVICE_NAMES --pretty" > $SOURCE_RESPONSE_FILES_DIR/source-docker-swarm-service-inspect-response.txt

echo ++++++
echo + Get network list
echo +++++++

infra-swarm-ssh-manager.sh "docker network ls --format '{{json .}}'" > $SOURCE_RESPONSE_FILES_DIR/source-docker-swarm-network-ls-response.json
infra-swarm-ssh-manager.sh "docker network ls" > $SOURCE_RESPONSE_FILES_DIR/source-docker-swarm-network-ls-response.txt

echo ++++++
echo + Get network info
echo +++++++

SWARM_INSTANCE_IPS=$(echo $(infra-swarm-list-all-instance-public-ips.sh))

for SWARM_INSTANCE_IP in $SWARM_INSTANCE_IPS; do
	RESPONSE_STRING_HEADER="++++Docker Engine Details for 	Instance:  $SWARM_INSTANCE_IP\n"
	
	printf '%b \n' "$RESPONSE_STRING_HEADER\n"
	
	DOCKER_CONTAINERS=$(ssh-aws.sh $SWARM_INSTANCE_IP "docker ps -q")
	
	echo ++++++
	echo + Get engine info - $SWARM_INSTANCE_IP
	echo +++++++

	printf '%b \n' "$RESPONSE_STRING_HEADER$(ssh-aws.sh $SWARM_INSTANCE_IP "docker info --format '{{json .}}'")\n" >> $SOURCE_RESPONSE_FILES_DIR/source-docker-engine-info-response.json
	printf '%b \n' "$RESPONSE_STRING_HEADER$(ssh-aws.sh $SWARM_INSTANCE_IP "docker info")\n" >> $SOURCE_RESPONSE_FILES_DIR/source-docker-engine-info-response.txt
	
	echo ++++++
	echo + Get docker engine processes - $SWARM_INSTANCE_IP
	echo +++++++
	
	printf '%b \n' "$RESPONSE_STRING_HEADER$(ssh-aws.sh $SWARM_INSTANCE_IP "docker ps --format '{{json .}}'")\n" >> $SOURCE_RESPONSE_FILES_DIR/source-docker-engine-ps-response.json
	printf '%b \n' "$RESPONSE_STRING_HEADER$(ssh-aws.sh $SWARM_INSTANCE_IP "docker ps")\n" >> $SOURCE_RESPONSE_FILES_DIR/source-docker-engine-ps-response.txt
	
	 if ! [ -z "$DOCKER_CONTAINERS" ]; 
	 then  
		echo ++++++
		echo + Get container details for all containers
		echo +++++++
		
		printf '%b \n' "$RESPONSE_STRING_HEADER$(ssh-aws.sh $SWARM_INSTANCE_IP "docker inspect $DOCKER_CONTAINERS")\n" >> $SOURCE_RESPONSE_FILES_DIR/source-docker-engine-inspect-containers-response.json

		echo ++++++
		echo + Get container stats for all containers
		echo +++++++
		
		printf '%b \n' "$RESPONSE_STRING_HEADER$(ssh-aws.sh $SWARM_INSTANCE_IP "docker stats --no-stream $DOCKER_CONTAINERS --format '{{json .}}'")\n" >> $SOURCE_RESPONSE_FILES_DIR/source-docker-engine-container-stats-response.json
		printf '%b \n' "$RESPONSE_STRING_HEADER$(ssh-aws.sh $SWARM_INSTANCE_IP "docker stats --no-stream $DOCKER_CONTAINERS")\n" >> $SOURCE_RESPONSE_FILES_DIR/source-docker-engine-container-stats-response.txt

	 else
	     printf '%b \n' "$RESPONSE_STRING_HEADER\n" >> $SOURCE_RESPONSE_FILES_DIR/source-docker-engine-inspect-containers-response.json
	     printf '%b \n' "$RESPONSE_STRING_HEADER\n" >> $SOURCE_RESPONSE_FILES_DIR/source-docker-engine-container-stats-response.json
	    printf '%b \n' "$RESPONSE_STRING_HEADER\n" >> $SOURCE_RESPONSE_FILES_DIR/source-docker-engine-container-stats-response.txt
	 fi;
done

infra-swarm-ssh-manager.sh "docker network inspect jarch-infra-logging-network" > $SOURCE_RESPONSE_FILES_DIR/source-docker-swarm-network-inspect-response.json

echo ++++++
echo + Get AWS Instance List
echo +++++++

aws ec2 describe-instances --output json > $SOURCE_RESPONSE_FILES_DIR/source-aws-instances-response.json
aws ec2 describe-instances --output text > $SOURCE_RESPONSE_FILES_DIR/source-aws-instances-response.txt

echo ++++++
echo + Get AWS VPC List
echo +++++++

aws ec2 describe-vpcs --output json > $SOURCE_RESPONSE_FILES_DIR/source-aws-vpcs-response.json
aws ec2 describe-vpcs --output text > $SOURCE_RESPONSE_FILES_DIR/source-aws-vpcs-response.txt
