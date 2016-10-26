SCRIPTS_DIR="$(cd "$(dirname "$0")" && pwd)"

INFRA_MODULES_HOME_DIR=$SCRIPTS_DIR/../infra-modules

LOGGING_SERVER_CODE_DIR=$INFRA_MODULES_HOME_DIR/centralized-logging-efk
NGINX_PROXY_CODE_DIR=$INFRA_MODULES_HOME_DIR/centralized-logging-efk


MACHINE_NAME_LOGGING_SERVER=infra-logging-server
MACHINE_NAME_CI=infra-ci-server

