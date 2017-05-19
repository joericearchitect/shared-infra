export AWS_ACCESS_KEY=
export AWS_SECRET_KEY=

export AWS_KEY_PATH=/home/vagrant/.ssh/jra-swarm-key-pair.pem

export GIT_PROJECTS_DIR=~/git
export APPS_DIR=~/workspace/apps
export MAVEN_CONF_DIR=~/workspace/maven/conf
export MAVEN_REPO_DIR=~/.m2
export AWS_DIR=~/.aws
export SHARE_DIR=~/share

export SCRIPTS_DIR_INFRA_DEV_ENV=/home/vagrant/git/shared-dev-env/scripts
export SCRIPTS_DIR_INFRA_DEV_ENV_LOCAL=/home/vagrant/git/shared-dev-env/scripts/local-machine
export SCRIPTS_DIR_INFRA_DEV_ENV_VM=/home/vagrant/git/shared-dev-env/scripts/remote-dev-vm
export SCRIPTS_DIR_SITE_JARCH=/home/vagrant/git/site-joe-rice-architect/devops/scripts
export SCRIPTS_DIR_APP_MINECAT=/home/vagrant/git/app-mine-the-catalog/devops/scripts


export SCRIPTS_DIR_INFRA_GLOBAL=$GIT_PROJECTS_DIR/shared-infra/scripts
export SCRIPTS_DIR_INFRA_DOCKER=$GIT_PROJECTS_DIR/shared-infra/scripts/docker

export PATH=$PATH:$SCRIPTS_DIR_INFRA_GLOBAL:$SCRIPTS_DIR_INFRA_DOCKER