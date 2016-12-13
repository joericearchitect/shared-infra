provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}


module "consul" {
    source = "github.com/hashicorp/consul/terraform/aws"

    key_name = "AWS SSH KEY NAME"
    key_path = "PATH TO ABOVE PRIVATE KEY"
    region = "us-east-1"
    servers = "3"
}