DIR="$(cd "$(dirname "$0")" && pwd)"

source $DIR/setenv.sh


echo .
echo .

echo ********************************************************************************
echo * About to commit changes for all projects
echo *  - git command to be run:  $1
echo *  - For projects:
echo *    +  Infra-Common -         - $INFRA_COMMON_GIT_PROJECT_DIR
echo *    +  site-joerice-architect - $SITE_JARCH_GIT_PROJECT_DIR
echo *    +  app-mine-the-catalog   - $APP_MCAT_GIT_PROJECT_DIR
echo ********************************************************************************

$SCRIPTS_DIR/dev-run-git-command-for-project.sh Infra-Common $INFRA_COMMON_GIT_PROJECT_DIR $1
$SCRIPTS_DIR/dev-run-git-command-for-project.sh site-joerice-architect $SITE_JARCH_GIT_PROJECT_DIR $1
$SCRIPTS_DIR/dev-run-git-command-for-project.sh app-mine-the-catalog $APP_MCAT_GIT_PROJECT_DIR $1


echo ********************************************************************************
echo * Done..
echo ********************************************************************************