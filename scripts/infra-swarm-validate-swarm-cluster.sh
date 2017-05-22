TEST=123

echo .
echo in main file.  test:  $TEST
echo .

time infra-swarm-validate-swarm-node.sh 54.164.127.51  ip-10-0-1-55       app-api-service      app-api-service.us-east-1a
time infra-swarm-validate-swarm-node.sh 34.200.241.54  ip-10-0-3-185      app-api-service      app-api-service.us-east-1b
time infra-swarm-validate-swarm-node.sh 34.207.193.110 ip-10-0-5-168      app-api-service      app-api-service.us-east-1c
time infra-swarm-validate-swarm-node.sh 52.90.74.199   ip-10-0-1-86       app-persistence      app-persistence.us-east-1a
time infra-swarm-validate-swarm-node.sh 34.206.1.99    ip-10-0-3-109      app-persistence      app-persistence.us-east-1b
time infra-swarm-validate-swarm-node.sh 54.89.57.244   ip-10-0-5-202      app-persistence      app-persistence.us-east-1c
time infra-swarm-validate-swarm-node.sh 107.21.89.61   ip-10-0-0-137      app-ui-web           app-ui-web.us-east-1a
time infra-swarm-validate-swarm-node.sh 54.236.36.119  ip-10-0-2-208      app-ui-web           app-ui-web.us-east-1b
time infra-swarm-validate-swarm-node.sh 107.22.133.207 ip-10-0-4-188      app-ui-web           app-ui-web.us-east-1c
time infra-swarm-validate-swarm-node.sh 54.88.34.14    ip-10-0-1-227      infra-build          infra-build.us-east-1a
time infra-swarm-validate-swarm-node.sh 34.200.220.232 ip-10-0-3-210      infra-build          infra-build.us-east-1b
time infra-swarm-validate-swarm-node.sh 52.90.52.131   ip-10-0-5-162      infra-build          infra-build.us-east-1c
time infra-swarm-validate-swarm-node.sh 54.227.56.111  ip-10-0-1-138      infra-logging        infra-logging.us-east-1a
time infra-swarm-validate-swarm-node.sh 34.200.250.147 ip-10-0-3-6        infra-logging        infra-logging.us-east-1b
time infra-swarm-validate-swarm-node.sh 52.87.247.143  ip-10-0-5-201      infra-logging        infra-logging.us-east-1c
time infra-swarm-validate-swarm-node.sh 34.207.56.235  ip-10-0-1-191      infra-swarm-manager  infra-swarm-manager.us-east-1a
time infra-swarm-validate-swarm-node.sh 34.205.41.215  ip-10-0-3-129      infra-swarm-manager  infra-swarm-manager.us-east-1b
time infra-swarm-validate-swarm-node.sh 52.91.235.37   ip-10-0-5-69       infra-swarm-manager  infra-swarm-manager.us-east-1c
