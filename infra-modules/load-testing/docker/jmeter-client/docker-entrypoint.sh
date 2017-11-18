#!/bin/bash
set -e
freeMem=`awk '/MemFree/ { print int($2/1024) }' /proc/meminfo`
s=$(($freeMem/10*8))
x=$(($freeMem/10*8))
n=$(($freeMem/10*2))

export JVM_ARGS="-Xmn${n}m -Xms${s}m -Xmx${x}m"

echo "#####################################################"
echo "--> Starting JMeter Client for Test - $TEST_PLAN_FILE_NAME"
echo "-->   TEST_PLAN_FILE_NAME = ${TEST_PLAN_FILE_NAME}"
echo "-->   TEST_PLAN_URL       = ${TEST_PLAN_URL}"
echo "-->   JRA_TEST_RUN_NAME   = ${JRA_TEST_RUN_NAME}"
echo "-->   JRA_TEST_RUN_ID     = ${JRA_TEST_RUN_ID}"
echo "-->   JRA_TEST_START_TIME = ${JRA_TEST_START_TIME}"
echo "-->   JMETER_VERSION      = ${JMETER_VERSION}"
echo "-->   SERVER_HOST_NAME    = ${SERVER_HOST_NAME}"
echo "-->   SERVER_RMI_PORT     = ${SERVER_RMI_PORT}"
echo "-->   CLIENT_RMI_PORT     = ${CLIENT_RMI_PORT}"
echo "-->   CLIENT_ENGINE_PORT  = ${CLIENT_ENGINE_PORT}  (shutdown port)"
echo "-->   REMOTE_HOSTS        = ${REMOTE_HOSTS}"
echo "#####################################################"

export FULL_LOAD_TEST_DIR=/load_tests/${TEST_DIR}

if ! [ -z "${JRA_TEST_RUN_ID}" ]
then
	JRA_TEST_RUN_ID=$(date +%s)
fi

if ! [ -z "${JRA_TEST_START_TIME}" ]
then
	JRA_TEST_START_TIME=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
fi

if ! [ -z "${TEST_PLAN_URL}" ]
then
	curl -o ${FULL_LOAD_TEST_DIR}/${TEST_PLAN_FILE_NAME} ${TEST_PLAN_URL}
fi

if [ ! -f "${FULL_LOAD_TEST_DIR}/${TEST_PLAN_FILE_NAME}" ]
then
	(>&2 echo "${0}: Error executing Jmeter Script:  Test Plan File is not found:  '${FULL_LOAD_TEST_DIR}/${TEST_PLAN_FILE_NAME}'.  Possible causes.  A) No TEST_PLAN_URL passed in.  B) TEST_PLAN_URL may be invalid...check it.  C) Test Plan does not exist in container.")
	(>&2 echo "   TEST_PLAN_URL ='${TEST_PLAN_URL}'")
    exit -1;
fi

$JMETER_BIN/jmeter \
    -n \
    -D "java.rmi.server.hostname=${SERVER_HOST_NAME}" \
    -D "client.rmi.localport=${CLIENT_RMI_PORT}" \
    -J "sample_variables=jra.test-plan,jra.test-run-name,jra-test-run-id,jra-test-run-start-timetamp" \
    -J "jmeterengine.nongui.port=${CLIENT_ENGINE_PORT}" \
    -J "jra.test-plan=${TEST_PLAN_FILE_NAME}" \
    -J "jra.test-run-name=${JRA_TEST_RUN_NAME}" \
    -J "jra-test-run-id=${JRA_TEST_RUN_ID}" \
    -J "jra-test-run-start-timetamp=${JRA_TEST_START_TIME}" \
    -t "/load_tests/${FULL_LOAD_TEST_DIR}/${TEST_PLAN_FILE_NAME}" \
    -l "/dev/stdout" \
    -R ${REMOTE_HOSTS}
exec tail -f jmeter.log
