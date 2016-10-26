export SCRIPTS_DIR="$(cd "$(dirname "$0")" && pwd)"

export INFRA_MODULES_HOME_DIR=$SCRIPTS_DIR/../infra-modules

export LOGGING_SERVER_CODE_DIR=$INFRA_MODULES_HOME_DIR/centralized-logging-efk
export NGINX_PROXY_CODE_DIR=$INFRA_MODULES_HOME_DIR/centralized-logging-efk


export MACHINE_NAME_LOGGING_SERVER=infra-logging-server
export MACHINE_NAME_CI=infra-ci-server

