DIR="$(cd "$(dirname "$0")" && pwd)"

source $DIR/setenv.sh

$SCRIPTS_DIR/dev-commit-git-changes.sh app-mine-the-catalog $APP_MCAT_GIT_PROJECT_DIR $1