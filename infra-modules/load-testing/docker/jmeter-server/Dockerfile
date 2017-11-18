FROM ubuntu:14.04

MAINTAINER Joe Rice <joericearchitect@gmail.com>

ENV JMETER_VERSION 2.13
ENV JMETER_HOME /usr/local/apache-jmeter-${JMETER_VERSION}
ENV JMETER_BIN $JMETER_HOME/bin
ENV SERVER_HOST_NAME 127.0.0.1
ENV CLIENT_RMI_PORT 1099
ENV SERVER_RMI_PORT 1099
ENV JRA_TEST_RUN_NAME default-jmeter-test-run
ENV JRA_TEST_RUN_ID default-123456789
ENV JRA_TEST_START_TIME 2000-01-01T12:00:11Z

RUN apt-get -qq update && \
    apt-get -yqq install openjdk-7-jre-headless unzip && \
    apt-get -q clean && \
    rm -rf /var/lib/apt/lists/*

COPY dependencies /tmp/dependencies

RUN tar -xzf /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz -C /usr/local && \
    unzip -oq "/tmp/dependencies/JMeterPlugins-*.zip" -d $JMETER_HOME && \
    apt-get -yqq purge unzip && \
    apt-get -yqq autoremove && \
    rm -rf /tmp/dependencies

ENV PATH $PATH:$JMETER_BIN

WORKDIR $JMETER_HOME

EXPOSE $SERVER_RMI_PORT
EXPOSE $CLIENT_ENGINE_PORT

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]