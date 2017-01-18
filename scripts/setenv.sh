export SCRIPTS_DIR="$(cd "$(dirname "$0")" && pwd)"

export INFRA_MODULES_HOME_DIR=$SCRIPTS_DIR/../infra-modules
export INFRA_ENVIRONMENTS_HOME_DIR=$SCRIPTS_DIR/../environments

export INFRA_MODULES_DOCKER_SWARM_DIR=$INFRA_MODULES_HOME_DIR/docker-swarm-infra
export INFRA_MODULES_DOCKER_SWARM_ANSIBLE_DIR=$INFRA_MODULES_DOCKER_SWARM_DIR/ansible

export LOGGING_SERVER_CODE_DIR=$INFRA_MODULES_HOME_DIR/centralized-logging-efk
export NGINX_PROXY_CODE_DIR=$INFRA_MODULES_HOME_DIR/centralized-logging-efk


export MACHINE_NAME_LOGGING_SERVER=infra-logging-server
export MACHINE_NAME_CI=infra-ci-server

export JRA_BUILD_PRIVATE_KEY_FILE='/home/vagrant/share/aws-keys/jra-build.pem'
