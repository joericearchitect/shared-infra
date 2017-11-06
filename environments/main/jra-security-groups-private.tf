# ---------------------------------------------------------------------------
# Private Subnets
#  - private subnets
#  - route table for subnets
#  - route table associations to all private subnets
# ---------------------------------------------------------------------------

resource "aws_security_group" "private_swarm-manager" {
	name = "${var.environment}.jra-sg.${var.region}-private-swarm-manager"
	description = "Swarm Nodes that will run containers related to swarm-managers & CI / CD pipelines"

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
        Name = "${var.environment}.sg.${var.region}-private-swarm-manager",
        jra.environment = "${var.environment}"
        jra.environment_type = "${var.environment_type}",
    	jra.environment-size = "${var.environment-size}",
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    }
}

resource "aws_security_group" "private_infra-build" {
	name = "${var.environment}.jra-sg.${var.region}-private-infra-build"
	description = "Swarm Nodes that will run containers related to infra-builds & CI / CD pipelines"

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
        Name = "${var.environment}.sg.${var.region}-private-infra-build",
        jra.environment = "${var.environment}"
        jra.environment_type = "${var.environment_type}",
    	jra.environment-size = "${var.environment-size}",
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    }
}

resource "aws_security_group" "private_app-persistence" {
	name = "${var.environment}.jra-sg.${var.region}-private-app-persistence"
	description = "Swarm Nodes that will run containers related to storage persistence for mangement apps (databases, caches, etc)"

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
        Name = "${var.environment}.sg.${var.region}-private-app-persistence",
        jra.environment = "${var.environment}"
        jra.environment_type = "${var.environment_type}",
    	jra.environment-size = "${var.environment-size}",
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    }
}

resource "aws_security_group" "private_infra-logging" {
	name = "${var.environment}.jra-sg.${var.region}-private-infra-logging"
	description = "Swarm Nodes that will run containers related to centralized logging stack"

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
        Name = "${var.environment}.sg.${var.region}-private-infra-logging",
        jra.environment = "${var.environment}"
        jra.environment_type = "${var.environment_type}",
    	jra.environment-size = "${var.environment-size}",
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    }
}

resource "aws_security_group" "private_infra-persistence" {
	name = "${var.environment}.jra-sg.${var.region}-private-infra-persistence"
	description = "Swarm Nodes that will run containers related to storage persistence for mangement apps (databases, caches, etc)"

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
        Name = "${var.environment}.sg.${var.region}-private-infra-persistence",
        jra.environment = "${var.environment}"
        jra.environment_type = "${var.environment_type}",
    	jra.environment-size = "${var.environment-size}",
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    }
}

resource "aws_security_group" "private_infra-repos" {
	name = "${var.environment}.jra-sg.${var.region}-private-infra-repos"
	description = "Swarm Nodes that will run containers related to storage persistence for mangement apps (databases, caches, etc)"

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
        Name = "${var.environment}.sg.${var.region}-private-infra-repos",
        jra.environment = "${var.environment}"
        jra.environment_type = "${var.environment_type}",
    	jra.environment-size = "${var.environment-size}",
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    }
}

