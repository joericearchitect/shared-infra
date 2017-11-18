FROM joericearchitect/jarch-infra-jmeter-server:1.0.0

MAINTAINER Joe Rice <joericearchitect@gmail.com>

ENV TEST_DIR default
ENV TEST_PLAN_FILE_NAME test-plan
ENV TEST_PLAN_URL default
ENV CLIENT_ENGINE_PORT 4445
ENV REMOTE_HOSTS 127.0.0.1

RUN apt-get -qq update && \
    apt-get -yqq install curl && \
    apt-get -q clean && \
    rm -rf /var/lib/apt/lists/*

COPY dependencies/jmeter-prometheus-plugin-0.0.1-SNAPSHOT.jar $JMETER_HOME/lib

EXPOSE $CLIENT_RMI_PORT
EXPOSE $CLIENT_ENGINE_PORT

COPY load_tests /
COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]