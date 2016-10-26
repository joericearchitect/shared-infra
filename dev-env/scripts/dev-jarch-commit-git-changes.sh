DIR="$(cd "$(dirname "$0")" && pwd)"

source $DIR/setenv.sh

$SCRIPTS_DIR/dev-commit-git-changes.sh site-joerice-architect $SITE_JARCH_GIT_PROJECT_DIR $1