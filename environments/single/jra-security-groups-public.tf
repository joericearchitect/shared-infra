# ---------------------------------------------------------------------------
# Private Security Groups
#  - private subnets
#  - route table for subnets
#  - route table associations to all private subnets
# ---------------------------------------------------------------------------

resource "aws_security_group" "public_swarm-manager" {
	name = "${var.environment}.jra-sg.${var.region}-public-swarm-manager"
	description = "Security Group for public swarm manager nodes"

	ingress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	vpc_id = "${aws_vpc.jra_vpc.id}",

	tags {
        Name = "${var.environment}.sg.${var.region}-public-swarm-manager",
        jra.environment = "${var.environment}",
        jra.environment_type = "${var.environment_type}",
    	jra.environment-size = "${var.environment-size}",
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    }
}


