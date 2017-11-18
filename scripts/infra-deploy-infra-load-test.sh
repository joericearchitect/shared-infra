ENV_DOMAIN_PREFIX= \
  JRA_TEST_RUN_NAME=docker-swarm-load-test \
  TEST_PLAN_FILE_NAME=docker-swarm-load-test \
  JRA_TEST_RUN_ID=$(date +%s) \
  JRA_TEST_START_TIME=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
  TEST_PLAN_FILE_NAME=infra-smoke-test-all-infra-services.jmx \
  TEST_PLAN_URL=https://raw.githubusercontent.com/joericearchitect/shared-infra/master/infra-modules/docker-swarm/jmeter/smoke-tests/infra-smoke-test-all-infra-services.jmx \
  docker stack deploy jarch-infra-load-test \
  -c docker-compose.yml

