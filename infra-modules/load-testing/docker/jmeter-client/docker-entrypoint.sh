#!/bin/bash
set -e
freeMem=`awk '/MemFree/ { print int($2/1024) }' /proc/meminfo`
s=$(($freeMem/10*8))
x=$(($freeMem/10*8))
n=$(($freeMem/10*2))

export JVM_ARGS="-Xmn${n}m -Xms${s}m -Xmx${x}m"

export FULL_LOAD_TEST_DIR=/load_tests/${TEST_DIR}

if ! [ -z "${JRA_TEST_RUN_ID}" ]
then
	JRA_TEST_RUN_ID=$(date +%s)
fi

if ! [ -z "${JRA_TEST_START_TIME}" ]
then
	JRA_TEST_START_TIME=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
fi

export START_EVENT_JSON_STRING="{ \
  \"LOAD_TEST_EVENT_TYPE\": \"start-jmeter-client\", \
  \"LOAD_TEST_COMPONENT\": \"jmeter-client\", \
  \"SERVER_HOST_NAME\": \"${SERVER_HOST_NAME}\", \
  \"SERVER_RMI_PORT\": \"${SERVER_RMI_PORT}\", \
  \"CLIENT_RMI_PORT\": \"${CLIENT_RMI_PORT}\", \
  \"CLIENT_ENGINE_PORT\": \"${CLIENT_ENGINE_PORT}\", \
  \"REMOTE_HOSTS\": \"${REMOTE_HOSTS}\", \
  \"JRA_TEST_RUN_NAME\": \"${JRA_TEST_RUN_NAME}\", \
  \"JRA_TEST_RUN_ID\": \"${JRA_TEST_RUN_ID}\", \
  \"JRA_TEST_START_TIME\": \"${JRA_TEST_START_TIME}\", \
  \"TEST_PLAN_FILE_NAME\": \"${TEST_PLAN_FILE_NAME}\", \
  \"TEST_PLAN_URL\": \"${TEST_PLAN_URL}\", \
  \"JMETER_VERSION\": \"${JMETER_VERSION}\", \
  \"JMETER_HOME\": \"${JMETER_HOME}\", \
  \"JMETER_BIN\": \"${JMETER_BIN}\" \
}"

echo "--> client-$JRA_TEST_RUN_ID - Start JMeter Client Event:  $START_EVENT_JSON_STRING"

if ! [ -z "${TEST_PLAN_URL}" ]
then
	echo "--> client-$JRA_TEST_RUN_ID - about to download test script.  Downloading from this URL:  \"${TEST_PLAN_URL}\" to this destination file:  \"${FULL_LOAD_TEST_DIR}/${TEST_PLAN_FILE_NAME}\""

	curl -o ${FULL_LOAD_TEST_DIR}/${TEST_PLAN_FILE_NAME} ${TEST_PLAN_URL}

	echo "--> client-$JRA_TEST_RUN_ID - curl returned with exit code:  $?"	
fi

if [ ! -f "${FULL_LOAD_TEST_DIR}/${TEST_PLAN_FILE_NAME}" ]
then
	(>&2 echo "--> client-$JRA_TEST_RUN_ID -Error executing Jmeter Script:  Test Plan File is not found:  '${FULL_LOAD_TEST_DIR}/${TEST_PLAN_FILE_NAME}'.  Possible causes.  A) No TEST_PLAN_URL passed in.  B) TEST_PLAN_URL may be invalid...check it.  C) Test Plan does not exist in container.")
    exit -1;
fi

JMETER_START_TIME=$(date)

echo "--> client-$JRA_TEST_RUN_ID - Starting the JMeter Engine at this time \"$JMETER_START_TIME\" with this test plan:  \"${FULL_LOAD_TEST_DIR}/${TEST_PLAN_FILE_NAME}\""

$JMETER_BIN/jmeter \
    -n \
    -J "sample_variables=jra.test-plan,jra.test-run-name,jra-test-run-id,jra-test-run-start-timetamp" \
    -J "jmeterengine.nongui.port=${CLIENT_ENGINE_PORT}" \
    -J "jra.test-plan=${TEST_PLAN_FILE_NAME}" \
    -J "jra.test-run-name=${JRA_TEST_RUN_NAME}" \
    -J "jra-test-run-id=${JRA_TEST_RUN_ID}" \
    -J "jra-test-run-start-timetamp=${JRA_TEST_START_TIME}" \
    -t "${FULL_LOAD_TEST_DIR}/${TEST_PLAN_FILE_NAME}" \
    -l "/dev/stdout"

JMETER_END_TIME=$(date)

JMETER_EXEC_DURATION=$(date -d @$(( $(date -d "$JMETER_END_TIME" +%s) - $(date -d "$JMETER_START_TIME" +%s) )) -u +'%H:%M:%S')

echo "--> client-$JRA_TEST_RUN_ID - \JMeter Engine ended at this time \"$JMETER_END_TIME\".  It ran for this duration:  \"$JMETER_EXEC_DURATION\""
