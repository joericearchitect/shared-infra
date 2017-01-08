# ---------------------------------------------------------------------------
# Private Subnets
#  - private subnets
#  - route table for subnets
#  - route table associations to all private subnets
# ---------------------------------------------------------------------------

resource "aws_security_group" "private_swarm-manager" {
	name = "jra-sg-${var.environment}-${var.region}-private-swarm-manager"
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
        Name = "jra-sg-${var.environment}-${var.region}-private-swarm-manager",
        environment = "${var.environment}"
        environment_type = "${var.environment_type}",
    	environment-size = "${var.environment-size}",
        environment-instance-id = "${random_id.env-instance.b64}"
    }
}


resource "aws_security_group" "private_build" {
	name = "jra-sg-${var.environment}-${var.region}-private-build"
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
        Name = "jra-sg-${var.environment}-${var.region}-private-build",
        environment = "${var.environment}"
        environment_type = "${var.environment_type}",
    	environment-size = "${var.environment-size}",
        environment-instance-id = "${random_id.env-instance.b64}"
    }
}


resource "aws_security_group" "private_app-api-service" {
	name = "jra-sg-${var.environment}-${var.region}-private-app-api-service"
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
        Name = "jra-sg-${var.environment}-${var.region}-private-app-api-service",
        environment = "${var.environment}"
        environment_type = "${var.environment_type}",
    	environment-size = "${var.environment-size}",
        environment-instance-id = "${random_id.env-instance.b64}"
    }
}

resource "aws_security_group" "private_app-persistence" {
	name = "jra-sg-${var.environment}-${var.region}-private-app-persistence"
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
        Name = "jra-sg-${var.environment}-${var.region}-private-app-persistence",
        environment = "${var.environment}"
        environment_type = "${var.environment_type}",
    	environment-size = "${var.environment-size}",
        environment-instance-id = "${random_id.env-instance.b64}"
    }
}


resource "aws_security_group" "private_management" {
	name = "jra-sg-${var.environment}-${var.region}-private-management"
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
        Name = "jra-sg-${var.environment}-${var.region}-private-management",
        environment = "${var.environment}"
        environment_type = "${var.environment_type}",
    	environment-size = "${var.environment-size}",
        environment-instance-id = "${random_id.env-instance.b64}"
    }
}

resource "aws_security_group" "private_management_persistence" {
	name = "jra-sg-${var.environment}-${var.region}-private-management-persistence"
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
        Name = "jra-sg-${var.environment}-${var.region}-private-management-persistence",
        environment = "${var.environment}"
        environment_type = "${var.environment_type}",
    	environment-size = "${var.environment-size}",
        environment-instance-id = "${random_id.env-instance.b64}"
    }
}

resource "aws_security_group" "private_admin" {
	name = "jra-sg-${var.environment}-${var.region}-private-admin"
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
        Name = "jra-sg-${var.environment}-${var.region}-private-admin",
        environment = "${var.environment}"
        environment_type = "${var.environment_type}",
    	environment-size = "${var.environment-size}",
        environment-instance-id = "${random_id.env-instance.b64}"
    }
}


resource "aws_security_group" "private_monitoring" {
	name = "jra-sg-${var.environment}-${var.region}-private-monitoring"
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
        Name = "jra-sg-${var.environment}-${var.region}-private-management-persistence",
        environment = "${var.environment}"
        environment_type = "${var.environment_type}",
    	environment-size = "${var.environment-size}",
        environment-instance-id = "${random_id.env-instance.b64}"
    }
}
