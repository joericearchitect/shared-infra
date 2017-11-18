#!/bin/bash
set -e
freeMem=`awk '/MemFree/ { print int($2/1024) }' /proc/meminfo`
s=$(($freeMem/10*8))
x=$(($freeMem/10*8))
n=$(($freeMem/10*2))
export JVM_ARGS="-Xmn${n}m -Xms${s}m -Xmx${x}m"

echo "#####################################################"
echo "--> Starting JMeter Server for Test - $TEST_PLAN_FILE_NAME"
echo "-->   JRA_TEST_RUN_NAME   = ${JRA_TEST_RUN_NAME}"
echo "-->   JRA_TEST_RUN_ID     = ${JRA_TEST_RUN_ID}"
echo "-->   JRA_TEST_START_TIME = ${JRA_TEST_START_TIME}"
echo "-->   JMETER_VERSION      = ${JMETER_VERSION}"
echo "-->   SERVER_HOST_NAME    = ${SERVER_HOST_NAME}"
echo "-->   SERVER_RMI_PORT     = ${SERVER_RMI_PORT}"
echo "-->   CLIENT_RMI_PORT     = ${CLIENT_RMI_PORT}"
echo "#####################################################"

JMETER_LOG="jmeter-server.log" && touch $JMETER_LOG && tail -f $JMETER_LOG &
exec jmeter-server \
    -D "java.rmi.server.hostname=${SERVER_HOST_NAME}" \
    -D "client.rmi.localport=${CLIENT_RMI_PORT}" \
    -D "server.rmi.localport=${SERVER_RMI_PORT}"
