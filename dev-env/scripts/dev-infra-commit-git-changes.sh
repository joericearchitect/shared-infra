DIR="$(cd "$(dirname "$0")" && pwd)"

source $DIR/setenv.sh

$SCRIPTS_DIR/dev-commit-git-changes.sh Infra-Common $INFRA_COMMON_GIT_PROJECT_DIR $1