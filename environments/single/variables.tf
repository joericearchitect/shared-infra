variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_key_path" {}
variable "aws_key_name" {}

variable "region" {
  default = "us-east-1"
}

variable "availability_zone" {
  description = "Availability Zones per region and failure zones"
  type = "map"
  default = {
    us-east-1.az-1 = "us-east-1a"
    us-east-1.az-2 = "us-east-1b"
    us-east-1.az-3 = "us-east-1c"
    us-east-1.az-4 = "us-east-1d"
    us-west-1.az-1 = "us-west-1a"
    us-west-1.az-2 = "us-west-1b"
    us-west-1.az-3 = "us-west-1c"
    us-west-1.az-4 = "us-west-1d"
  }
}

variable "amis_docker_node" {
  description = "AMIs for docker-engine nodes by region"
  type = "map"
  default = {
    us-east-1 = "ami-7a265d6c"
    us-west-2 = "ami-06b94666"
  }
}

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
    default = "10.0.1.0/24"
}

# ---------------------------------------------------------------------------
# JRA Infra Variables
# ---------------------------------------------------------------------------
variable "environment" {
    description = "The environment this resource is running in"
	default = "latest"
}
variable "environment_type" {
    description = "The environment this resource is running in"
	default = "latest"
}
variable "environment-flip" {
    description = "whether this region is running as blue or green"
	default = "blue"
}

# ---------------------------------------------------------------------------
# JRA domain Variables
# ---------------------------------------------------------------------------
variable "jra-domain-name" {
    description = "The jra domain name"
	default = "joericearchitect.com"
}
variable "jra-domain-hosted-zone-id" {
    description = "The zone-id of the jra domain hosted zone"
	default = "Z2ZVLIKT9MX0K8"
}
variable "environment-domain-prefix" {
    description = "The environment this resource is running in"
	default = "latest."
}

# ---------------------------------------------------------------------------
# Ansible Provisioning Variables
# ---------------------------------------------------------------------------
variable "ansible-docker-install-version" {
    description = "The version of docker to install on each ec2 instance"
	default = "17.09.0~ce-0~ubuntu"
}
variable "ansible-remote-host-user" {
    description = "The user ansible will use to ssh into remote machines to provision docker swarm"
	default = "ubuntu"
}
variable "ansible-host-inventory-file" {
    description = "The location of the ansible host inventory file.  This includes directory and file name.  Can be fully qualified path or releative"
	default = "../../infra-modules/docker-swarm-infra/ansible/ec2-inventory/ec2.py"
}
variable "ansible-custom-configuration-file" {
    description = "The location of the ansible host inventory file.  This includes directory and file name.  Can be fully qualified path or releative"
	default = "../../infra-modules/docker-swarm-infra/ansible/ansible.cfg"
}
variable "ansible-provision-swarm-cluster-playbook-file" {
    description = "The location of the ansible playbook file that will set up a new docker swarm.  This includes directory and file name.  Can be fully qualified path or releative"
	default = "../../infra-modules/docker-swarm-infra/ansible/swarm-provision-cluster.yml"
}
variable "ansible-provision-infra-app-playbook-file" {
    description = "The location of the ansible playbook file that will set up a new docker swarm.  This includes directory and file name.  Can be fully qualified path or releative"
	default = "../../infra-modules/docker-swarm-infra/ansible/deploy-infra-apps-services.yml"
}
variable "ansible-configure-swarm-cluster-playbook-file" {
    description = "The location of the ansible playbook file that will set up a new docker swarm.  This includes directory and file name.  Can be fully qualified path or releative"
	default = "../../infra-modules/docker-swarm/ansible/swarm-configure-cluster.yml"
}
variable "ansible-deploy-infra-logging-services-playbook-file" {
    description = "The location of the ansible playbook file that will set up a new docker swarm.  This includes directory and file name.  Can be fully qualified path or releative"
	default = "../../infra-modules/centralized-logging/ansible/deploy-infra-logging-services.yml"
    description = "The location of the ansible playbook file that will tear down a docker swarm.  This includes directory and file name.  Can be fully qualified path or releative"
	default = "../../infra-modules/docker-swarm-infra/ansible/swarm-remove-cluster.yml"
}

# ---------------------------------------------------------------------------
# Environment Sizing Variables
# ---------------------------------------------------------------------------
variable "environment-size" {
    description = "Size of an environment"
    default = "small"
}

variable "ec2-instance-type" {
  description = "What ec2 instance type to use per environment size and swawrm-node type"
  type = "map"
  default = {
    small.swarm-manager = "t2.micro"
    small.swarm-worker = "t2.micro"

    medium.swarm-manager = "t2.medium"
    medium.swarm-worker = "t2.medium"

    large.swarm-manager = "m4.large"
    large.swarm-worker = "m4.large"
  }
}
