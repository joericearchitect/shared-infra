# check status

echo .
echo in node file.  test:  $TEST
echo .

NODE_TO_TEST_PUBLIC_IP=$1
NODE_TO_TEST_HOST_NAME=$2
NODE_TO_TEST_NODE_TYPE=$3
NODE_TO_TEST_NODE_NAME=$4

SWARM_MANAGER_NODE="$(infra-swarm-list-manager-ips.sh)"

SWARM_MANAGER_NODE="$(echo $SWARM_MANAGER_NODE | cut -d ' ' -f1)"

echo .
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo +  JRA Swarm Environment Validator for host:  $NODE_TO_TEST_PUBLIC_IP - $NODE_TO_TEST_NODE_NAME
echo +    Server Info
echo +       -  IP Address:  - $NODE_TO_TEST_PUBLIC_IP
echo +       -  Host Name:   - $NODE_TO_TEST_HOST_NAME
echo +       -  Node Type:   - $NODE_TO_TEST_NODE_TYPE
echo +       -  Node Name:   - $NODE_TO_TEST_NODE_NAME
echo +
echo +    Gathering Cluster Info and Validating....
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo .

echo ...
echo +++++++++++++++++++++++++++++++++++++++++++++
echo +    Gathering Node Specific Info for $NODE_TO_TEST_PUBLIC_IP - $NODE_TO_TEST_NODE_NAME....
echo +++++++++++++++++++++++++++++++++++++++++++++
echo ...

SWARM_NODE_INFO_STRING=$(ssh-aws.sh $SWARM_MANAGER_NODE "docker node ls")
SWARM_SERVICEE_INFO_STRING=$(ssh-aws.sh $SWARM_MANAGER_NODE "docker service ls")
DOCKER_CONFIG_FILE_EXISTS=$(ssh-aws.sh $NODE_TO_TEST_PUBLIC_IP "test -e /etc/systemd/system/docker.service.d/jra-docker-config.conf && echo true || echo false")
DOCKER_CONFIG_FILE_CONTENTS=$(ssh-aws.sh $NODE_TO_TEST_PUBLIC_IP "sudo cat /etc/systemd/system/docker.service.d/jra-docker-config.conf")
DOCKER_INFO_STRING=$(ssh-aws.sh $NODE_TO_TEST_PUBLIC_IP "docker info")
SWARM_NODE_INSPECT_STRING=$(ssh-aws.sh $SWARM_MANAGER_NODE "docker node inspect $NODE_TO_TEST_HOST_NAME")

echo ...
echo +++++++++++++++++++++++++++++++++++++++++++++
echo +    Validating $NODE_TO_TEST_PUBLIC_IP - $NODE_TO_TEST_NODE_NAME....
echo +++++++++++++++++++++++++++++++++++++++++++++
echo ...

IS_SWARM_NODE_ACTIVE=$(printf "$SWARM_NODE_INFO_STRING" | grep $NODE_TO_TEST_HOST_NAME | grep  -q 'Active' && echo "true" || echo "false")
IS_SWARM_MANAGER_NODE=$(printf "$SWARM_NODE_INFO_STRING" | grep $NODE_TO_TEST_HOST_NAME | grep  -q 'Reachable' && echo "true" || echo "false")
IS_SWARM_MAMNAGER_LEADER=$(printf "$SWARM_NODE_INFO_STRING" | grep $NODE_TO_TEST_HOST_NAME | grep  -q 'Reachable' && echo "true" || echo "false")
DOES_DOCKER_CONFIG_FILE_EXIST=$(ssh-aws.sh $NODE_TO_TEST_PUBLIC_IP "test -e /etc/systemd/system/docker.service.d/jra-docker-config.conf && echo true || echo false")
IS_DOCKER_CONFIGURED_FOR_JRA=$(printf "$DOCKER_CONFIG_FILE_CONTENTS" | grep  -q 'jra' && echo "true" || echo "false")
IS_DOCKER_CONFIGURED_FOR_LOGGING=$(printf "$DOCKER_CONFIG_FILE_CONTENTS" | grep  -q 'log-driver' && echo "true" || echo "false")
HAS_DOCKER_CONFIG_FILE=
IS_NODE_ACTIVE=
IS_FLUENTD_DEPLOYED=
IS_FLUENTD_RUNNING=
IS_ELASTICSEARCH_DEPLOYED=
IS_ELASTICSEARCH_RUNNING=
IS_KIBANA_DEPLOYED=
IS_KIBANA_RUNNING=

echo .
echo +++++++++++++++++++++++++++++++++++++++++++++
echo +    Validations for host  $NODE_TO_TEST_PUBLIC_IP - $NODE_TO_TEST_NODE_NAME
echo +
echo +    Config Validation Checks
echo +       -  Is Swarm Node Active:..............- $IS_SWARM_NODE_ACTIVE 
echo +       -  Is Swarm Manager Node:.............- $IS_SWARM_MANAGER_NODE
echo +       -  Is Swarm Manager Leader:...........- $IS_SWARM_MAMNAGER_LEADER 
echo +       -  Does Docker Config File exist:.....- $DOES_DOCKER_CONFIG_FILE_EXIST 
echo +       -  Is Docker Configured for JRA:......- $IS_DOCKER_CONFIGURED_FOR_JRA
echo +       -  Is Docker Configured for Logging:..- $IS_DOCKER_CONFIGURED_FOR_LOGGING
echo +          Are All Nodes Acgive:..............- $IS_NODE_ACTIVE
echo +
echo +    Central Logging Checks
echo +       -  iS FluentD Deployed?:..............- $IS_FLUENTD_DEPLOYED 
echo +       -  iS Fluentd Running?:...............- $IS_FLUENTD_RUNNING 
echo +       -  iS ElasticSearch Deployed:.........- $IS_ELASTICSEARCH_DEPLOYED 
echo +       -  iS ElasticSearch Running?:.........- $IS_ELASTICSEARCH_RUNNING 
echo +       -  iS Kibana Deployed?:...............- $IS_KIBANA_DEPLOYED 
echo +       -  iS Kibana Running?:................- $IS_KIBANA_RUNNING 
echo +++++++++++++++++++++++++++++++++++++++++++++
echo .

echo .
echo +++++++++++++++++++++++++++++++++++++++++++++
echo +  Printing SWARM_NODE_INFO_STRING
printf "$SWARM_NODE_INFO_STRING"
echo +++++++++++++++++++++++++++++++++++++++++++++
echo .

echo .
echo +++++++++++++++++++++++++++++++++++++++++++++
echo +  Printing SWARM_SERVICEE_INFO_STRING
printf "$SWARM_SERVICEE_INFO_STRING"
echo +++++++++++++++++++++++++++++++++++++++++++++
echo .

echo .
echo +++++++++++++++++++++++++++++++++++++++++++++
echo +  Printing DOCKER_CONFIG_FILE_EXISTS
printf "$DOCKER_CONFIG_FILE_EXISTS"
echo +++++++++++++++++++++++++++++++++++++++++++++
echo .

echo .
echo +++++++++++++++++++++++++++++++++++++++++++++
echo +   Printing DOCKER_CONFIG_FILE_CONTENTS
printf "$DOCKER_CONFIG_FILE_CONTENTS"
echo +++++++++++++++++++++++++++++++++++++++++++++
echo .

echo .
echo +++++++++++++++++++++++++++++++++++++++++++++
echo +  Printing DOCKER_INFO_STRING 
printf "$DOCKER_INFO_STRING"
echo +++++++++++++++++++++++++++++++++++++++++++++
echo .

echo .
echo +++++++++++++++++++++++++++++++++++++++++++++
echo +  Printing SWARM_NODE_INSPECT_STRING
printf "$SWARM_NODE_INSPECT_STRING"
echo +++++++++++++++++++++++++++++++++++++++++++++
echo .
echo .
echo .
echo .

 #ssh-aws.sh $SWARM_MANAGER_NODE "docker service ls | grep fluentd"

 #ssh-aws.sh $SWARM_MANAGER_NODE "cat /etc/systemd/system/docker.service.d/jra-docker-config.conf"
 #ssh-aws.sh 34.206.1.99 "grep -q 'log-driver'  /etc/systemd/system/docker.service.d/jra-docker-config.conf"
 #ssh-aws.sh 52.87.247.143 "dockder info | grep jra"
 #ssh-aws.sh $SWARM_MANAGER_NODE "docker node inspect $NODE_TO_TEST_HOST_NAME" | grep jra
 #ssh-aws.sh $SWARM_MANAGER_NODE "docker node ls | grep ip-10-0-5-162 | grep Active"
 
 
 
 