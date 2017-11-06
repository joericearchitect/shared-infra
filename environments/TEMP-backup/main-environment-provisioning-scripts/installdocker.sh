sudo apt-get update

sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
 
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update

sudo apt-get install -y docker-ce=17.09.0~ce-0~ubuntu

sudo groupadd -f docker

sudo usermod -aG docker ubuntu

sudo apt-get install -y python && sudo apt install -y python-pip && sudo pip install docker