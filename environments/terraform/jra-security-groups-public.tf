# ---------------------------------------------------------------------------
# Private Security Groups
#  - private subnets
#  - route table for subnets
#  - route table associations to all private subnets
# ---------------------------------------------------------------------------

resource "aws_security_group" "public_app-ui-web" {
	name = "jra-sg-${var.environment}-${var.region}-public-app-ui-web"
	description = "Security Group for public web ui apps"

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
        Name = "jra-sg-${var.environment}-${var.region}-public-app-ui-web",
        com.jra.environment = "${var.environment}",
        com.jra.environment_type = "${var.environment_type}",
    	com.jra.environment-size = "${var.environment-size}",
        com.jra.environment-instance-id = "${random_id.env-instance.b64}"
    }
}


resource "aws_security_group" "public_app-api-web" {
	name = "jra-sg-${var.environment}-${var.region}-public-app-api-web"
	description = "Security groups for public web apis"

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
        Name = "jra-sg-${var.environment}-${var.region}-public-app-api-web",
        com.jra.environment = "${var.environment}",
        com.jra.environment_type = "${var.environment_type}",
    	com.jra.environment-size = "${var.environment-size}",
        com.jra.environment-instance-id = "${random_id.env-instance.b64}"
    }
}

