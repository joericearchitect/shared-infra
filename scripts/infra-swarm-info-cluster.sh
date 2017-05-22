declare -A rows=( ) columns=( )
declare -A TAG_MAP

AWS_JSON=$(aws ec2 describe-instances)

NUM_OF_INSTANCES=
NUM_OF_RESERVATIONS=$(echo $AWS_JSON | jq '.Reservations | length')
NUM_OF_INSGANCES=
NUM_OF_TAGS=

INSTANCE_JSON=""
RESERVATION_JSON=""
TAGS_JSON=""

REPORT_FIELD_RESOURCE_ID=""
REPORT_FIELD_PUBLIC_ADDRESS=""
REPORT_FIELD_PUBLIC_DNS_NAME=""
REPORT_FIELD_PRIVATE_ADDRESS=""
REPORT_FIELD_PRIVATE_DNS_NAME=""
REPORT_FIELD_SWARM_NODE_TYPE=""
REPORT_FIELD_SWARM_INSTANCE_TYPE=""
REPORT_FIELD_FAILURE_ZONE=""
REPORT_FIELD_ENVIRONMENT_TYPE=""


for ((i = 0 ; i < $NUM_OF_RESERVATIONS ; i++ )); do
  RESERVATION_JSON=$(echo $AWS_JSON | jq ".Reservations[$i] | {ReservationId: .ReservationId, Instances: .Instances}")

  NUM_OF_INSGANCES=$(echo $RESERVATION_JSON | jq '.Instances | length')
  

  for ((k = 0 ; k < $NUM_OF_INSGANCES ; k++ )); do  
	  INSTANCE_JSON=$(echo $RESERVATION_JSON | jq ".Instances[$k] | {PublicIpAddress: .PublicIpAddress, PrivateIpAddress: .PrivateIpAddress, PublicDnsName: .PublicDnsName, PrivateDnsName: .PrivateDnsName, Tags: .Tags}")
	  
	  NUM_OF_TAGS=$(echo $INSTANCE_JSON | jq '.Tags | length')
	  
      REPORT_STRING="$REPORT_STRING$(echo $INSTANCE_JSON | jq '.PublicIpAddress' | sed -e 's/^"//' -e 's/"$//')"
      REPORT_STRING="$REPORT_STRING,$(echo $INSTANCE_JSON | jq '.PublicDnsName' | sed -e 's/^"//' -e 's/"$//' | cut -d '.' -f1)"
      REPORT_STRING="$REPORT_STRING,$(echo $INSTANCE_JSON | jq '.PrivateIpAddress' | sed -e 's/^"//' -e 's/"$//')"
      REPORT_STRING="$REPORT_STRING,$(echo $INSTANCE_JSON | jq '.PrivateDnsName' | sed -e 's/^"//' -e 's/"$//' | cut -d '.' -f1)"
	  
	  for ((l = 0 ; l < $NUM_OF_TAGS ; l++ )); do
		  TAGS_JSON=$(echo $INSTANCE_JSON | jq ".Tags[$l]")
		  	  
		  TAG_MAP_KEY=$(echo $TAGS_JSON | jq '.Key' | sed -e 's/^"//' -e 's/"$//')
		  TAG_MAP_VALUE=$(echo $TAGS_JSON | jq '.Value' | sed -e 's/^"//' -e 's/"$//')
	
		  TAG_MAP[$TAG_MAP_KEY]=$TAG_MAP_VALUE
	  done

	  REPORT_STRING="$REPORT_STRING,${TAG_MAP[jra.swarm-node-type]}"
	  REPORT_STRING="$REPORT_STRING,${TAG_MAP[jra.swarm-instance-type]}"
	  REPORT_STRING="$REPORT_STRING,${TAG_MAP[jra.failure-zone]}"
	  REPORT_STRING="$REPORT_STRING,${TAG_MAP[jra.environment_type]}"
	  REPORT_STRING="$REPORT_STRING,${TAG_MAP[jra.swarm-node-type]}-${TAG_MAP[jra.failure-zone]}"
	  
	  REPORT_STRING="$REPORT_STRING\n"
  done

done


REPORT_STRING=$(printf '%b\n' "$REPORT_STRING" | sort -k 5 -k 7 -t ',')

REPORT_STRING="PUBLIC IP ADDRESS,PUBLIC HOST NAME,PRIVATE IP ADDRESS,PRIVATE HOST NAME,JRA NODE TYPE,JRA INSTNACE TYPE,JRA FAILURE ZONE,JRA ENV TYPE,NAME\n"$REPORT_STRING

printf '%b\n' "$REPORT_STRING" | column -t -s ','
