#!/bin/bash
set -e
freeMem=`awk '/MemFree/ { print int($2/1024) }' /proc/meminfo`
s=$(($freeMem/10*8))
x=$(($freeMem/10*8))
n=$(($freeMem/10*2))
export JVM_ARGS="-Xmn${n}m -Xms${s}m -Xmx${x}m"

export START_EVENT_JSON_STRING="{ \
  \"LOAD_TEST_EVENT_TYPE\": \"start-jmeter-server\", \
  \"LOAD_TEST_COMPONENT\": \"jmeter-server\", \
  \"SERVER_HOST_NAME\": \"${SERVER_HOST_NAME}\", \
  \"SERVER_RMI_PORT\": \"${SERVER_RMI_PORT}\", \
  \"CLIENT_RMI_PORT\": \"${CLIENT_RMI_PORT}\", \
  \"JRA_TEST_RUN_NAME\": \"${JRA_TEST_RUN_NAME}\", \
  \"JRA_TEST_RUN_ID\": \"${JRA_TEST_RUN_ID}\", \
  \"JRA_TEST_START_TIME\": \"${JRA_TEST_START_TIME}\", \
  \"JMETER_VERSION\": \"${JMETER_VERSION}\", \
  \"JMETER_HOME\": \"${JMETER_HOME}\", \
  \"JMETER_BIN\": \"${JMETER_BIN}\" \
}"

echo "--> server-$JRA_TEST_RUN_ID - Start JMeter Server Event:  $START_EVENT_JSON_STRING"

JMETER_START_TIME=$(date)

echo "--> server-$JRA_TEST_RUN_ID - Starting the JMeter Server at this time \"$JMETER_START_TIME\""

JMETER_LOG="jmeter-server.log" && touch $JMETER_LOG && tail -f $JMETER_LOG &
exec jmeter-server \
    -D "java.rmi.server.hostname=${SERVER_HOST_NAME}" \
    -D "client.rmi.localport=${CLIENT_RMI_PORT}" \
    -D "server.rmi.localport=${SERVER_RMI_PORT}"
