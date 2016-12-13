variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_key_path" {}
variable "aws_key_name" {}

variable "region" {
  default = "us-east-1"
}

variable "amis_docker_node" {
  description = "AMIs for docker-engine nodes by region"
  type = "map"
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
  }
}

variable "amis_nat" {
  description = "AMIs for docker-engine nodes by region"
  type = "map"
  default = {
    us-east-1 = "ami-13be557e"
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
variable "environment-flip" {
    description = "whether this region is running as blue or green"
	default = "blue"
}