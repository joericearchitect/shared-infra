# ---------------------------------------------------------------------------
# Private Subnets
#  - private subnets
#  - route table for subnets
#  - route table associations to all private subnets
# ---------------------------------------------------------------------------

resource "aws_security_group" "private_swarm-manager" {
	name = "${var.environment}.jra-sg.${var.region}-private-swarm-manager"
	description = "Swarm Manager that will run the docker swarm manager"

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


resource "aws_security_group" "private_build" {
	name = "${var.environment}.jra-sg.${var.region}-private-build"
	description = "Swarm Nodes that will run containers related to builds & CI / CD pipelines"

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
        Name = "${var.environment}.sg.${var.region}-private-build",
        jra.environment = "${var.environment}"
        jra.environment_type = "${var.environment_type}",
    	jra.environment-size = "${var.environment-size}",
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    }
}


resource "aws_security_group" "private_app-api-service" {
	name = "${var.environment}.jra-sg.${var.region}-private-app-api-service"
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
        Name = "${var.environment}.sg.${var.region}-private-app-api-service",
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


resource "aws_security_group" "private_management" {
	name = "${var.environment}.jra-sg.${var.region}-private-management"
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
        Name = "${var.environment}.sg.${var.region}-private-management",
        jra.environment = "${var.environment}"
        jra.environment_type = "${var.environment_type}",
    	jra.environment-size = "${var.environment-size}",
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    }
}

resource "aws_security_group" "private_management_persistence" {
	name = "${var.environment}.jra-sg.${var.region}-private-management-persistence"
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
        Name = "${var.environment}.sg.${var.region}-private-management-persistence",
        jra.environment = "${var.environment}"
        jra.environment_type = "${var.environment_type}",
    	jra.environment-size = "${var.environment-size}",
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    }
}

resource "aws_security_group" "private_admin" {
	name = "${var.environment}.jra-sg.${var.region}-private-admin"
	description = "Swarm Nodes that will run containers related to admin apps (timetracking, jira, wikis, etc)"

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
        Name = "${var.environment}.sg.${var.region}-private-admin",
        jra.environment = "${var.environment}"
        jra.environment_type = "${var.environment_type}",
    	jra.environment-size = "${var.environment-size}",
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    }
}


resource "aws_security_group" "private_monitoring" {
	name = "${var.environment}.jra-sg.${var.region}-private-monitoring"
	description = "Swarm Nodes that will run containers related to monitoring (logging servers, metrics collection, etc"

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
        Name = "${var.environment}.sg.${var.region}-private-management-persistence",
        jra.environment = "${var.environment}"
        jra.environment_type = "${var.environment_type}",
    	jra.environment-size = "${var.environment-size}",
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    }
}
