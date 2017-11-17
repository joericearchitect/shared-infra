FROM joericearchitect/jarch-infra-jmeter-server:1.0.0

MAINTAINER Joe Rice <joericearchitect@gmail.com>

ENV TEST_DIR default
ENV TEST_PLAN_NAME test-plan
ENV TEST_PLAN_URL
ENV JRA_TEST_RUN_NAME default-jmeter-test-run
ENV JRA_TEST_RUN_ID default-123456789
ENV JRA_TEST_START_TIME 2000-01-01T12:00:11Z
ENV REMOTE_HOSTS 127.0.0.1

COPY load_tests /
COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]