FROM ubuntu:17.04

MAINTAINER Joe Rice <joericearchitect@gmail.com>

ENV JMETER_VERSION 3.3
ENV JMETER_HOME /usr/local/apache-jmeter-${JMETER_VERSION}
ENV JMETER_BIN $JMETER_HOME/bin
ENV SERVER_HOST_NAME 127.0.0.1
ENV CLIENT_RMI_PORT 1099
ENV SERVER_RMI_PORT 1099
ENV JRA_TEST_RUN_NAME default-jmeter-test-run
ENV JRA_TEST_RUN_ID default-123456789
ENV JRA_TEST_START_TIME 2000-01-01T12:00:11Z

RUN apt-get update && \
    apt-get -y install openjdk-8-jre-headless unzip curl wget && \
    apt-get -q clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tmp/dependencies && \
    curl -o /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz http://mirrors.gigenet.com/apache//jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz && \
    tar -xzf /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz -C /usr/local && \
    apt-get -yqq purge unzip wget curl && \
    apt-get -yqq autoremove && \
    rm -rf /tmp/dependencies

ENV PATH $PATH:$JMETER_BIN

WORKDIR $JMETER_HOME

EXPOSE $SERVER_RMI_PORT
EXPOSE $CLIENT_ENGINE_PORT

COPY dependencies/JMeter-InfluxDB-Writer-plugin-1.2.jar $JMETER_HOME/lib/ext

COPY docker-entrypoint.sh /

COPY jmeter.properties $JMETER_BIN

ENTRYPOINT ["/docker-entrypoint.sh"]