
# ---------------------------------------------------------------------------
# Swarm Manager Instances
#  - EC2 Instances for across 3 avail zones
# ---------------------------------------------------------------------------
resource "aws_instance" "swarm-manager-az-1" {
	ami = "${lookup(var.amis_docker_node, "${var.region}")}"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-1")}"
	instance_type = "${lookup(var.ec2-instance-type, "${var.environment-size}.swarm-manager")}"
	key_name = "${var.aws_key_name}"
	security_groups = ["${aws_security_group.private_swarm-manager.id}"]
	subnet_id = "${aws_subnet.az-1-private.id}",
	provisioner "local-exec" {
       command = "echo "
    }

	tags {
        Name = "jra-instance.swarm-manager.manager.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-1")}",
        com.jra.environment = "${var.environment}"
        com.jra.environment_type = "${var.environment_type}"
        com.jra.environment-instance-id = "${random_id.env-instance.b64}"
    	com.jra.failure_zone = "${var.region}-az-1"
    	com.jra.environment-size = "${var.environment-size}"
    	com.jra.swarm-instance-type = "swarm-manager"
    	com.jra.swarm-node-type = "swarm-manager"
    	com.jra.subnet-type = "private"
    }
}
resource "aws_instance" "swarm-manager-az-2" {
	ami = "${lookup(var.amis_docker_node, "${var.region}")}"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-2")}"
	instance_type = "${lookup(var.ec2-instance-type, "${var.environment-size}.swarm-manager")}"
	key_name = "${var.aws_key_name}"
	security_groups = ["${aws_security_group.private_swarm-manager.id}"]
	subnet_id = "${aws_subnet.az-2-private.id}",
	provisioner "local-exec" {
       command = "echo "
    }

	tags {
        Name = "jra-instance.swarm-manager.manager.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-2")}",
        com.jra.environment = "${var.environment}"
        com.jra.environment_type = "${var.environment_type}"
        com.jra.environment-instance-id = "${random_id.env-instance.b64}"
    	com.jra.failure_zone = "${var.region}-az-2"
    	com.jra.environment-size = "${var.environment-size}"
    	com.jra.swarm-instance-type = "swarm-manager"
    	com.jra.swarm-node-type = "swarm-manager"
    	com.jra.subnet-type = "private"
    }
}
resource "aws_instance" "swarm-manager-az-3" {
	ami = "${lookup(var.amis_docker_node, "${var.region}")}"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-3")}"
	instance_type = "${lookup(var.ec2-instance-type, "${var.environment-size}.swarm-manager")}"
	key_name = "${var.aws_key_name}"
	security_groups = ["${aws_security_group.private_swarm-manager.id}"]
	subnet_id = "${aws_subnet.az-3-private.id}",
	provisioner "local-exec" {
       command = "echo "
    }

	tags {
        Name = "jra-instance.swarm-manager.manager.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-3")}",
        com.jra.environment = "${var.environment}"
        com.jra.environment_type = "${var.environment_type}"
        com.jra.environment-instance-id = "${random_id.env-instance.b64}"
    	com.jra.failure_zone = "${var.region}-az-3"
    	com.jra.environment-size = "${var.environment-size}"
    	com.jra.swarm-instance-type = "swarm-manager"
    	com.jra.swarm-node-type = "swarm-manager"
    	com.jra.subnet-type = "private"
    }
}

# ---------------------------------------------------------------------------
# Build - Swarm Node Instances
#  - EC2 Instances for across 3 avail zones
# ---------------------------------------------------------------------------
resource "aws_instance" "build-az-1" {
	ami = "${lookup(var.amis_docker_node, "${var.region}")}"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-1")}"
	instance_type = "${lookup(var.ec2-instance-type, "${var.environment-size}.build")}"
	key_name = "${var.aws_key_name}"
	security_groups = ["${aws_security_group.private_build.id}"]
	subnet_id = "${aws_subnet.az-1-private.id}",
	provisioner "local-exec" {
       command = "echo "
    }

	tags {
        Name = "jra-instance.swarm-worker.build.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-1")}",
        com.jra.environment = "${var.environment}"
        com.jra.environment_type = "${var.environment_type}"
        com.jra.environment-instance-id = "${random_id.env-instance.b64}"
    	com.jra.failure_zone = "${var.region}-az-1"
    	com.jra.environment-size = "${var.environment-size}"
    	com.jra.swarm-instance-type = "swarm-worker"
    	com.jra.swarm-node-type = "build"
    	com.jra.subnet-type = "private"
    }
}
resource "aws_instance" "build-az-2" {
	ami = "${lookup(var.amis_docker_node, "${var.region}")}"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-2")}"
	instance_type = "${lookup(var.ec2-instance-type, "${var.environment-size}.build")}"
	key_name = "${var.aws_key_name}"
	security_groups = ["${aws_security_group.private_build.id}"]
	subnet_id = "${aws_subnet.az-2-private.id}",
	provisioner "local-exec" {
       command = "echo "
    }

	tags {
        Name = "jra-instance.swarm-worker.build.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-2")}",
        com.jra.environment = "${var.environment}"
        com.jra.environment_type = "${var.environment_type}"
        com.jra.environment-instance-id = "${random_id.env-instance.b64}"
    	com.jra.failure_zone = "${var.region}-az-2"
    	com.jra.environment-size = "${var.environment-size}"
    	com.jra.swarm-instance-type = "swarm-worker"
    	com.jra.swarm-node-type = "build"
    	com.jra.subnet-type = "private"
    }
}
resource "aws_instance" "build-az-3" {
	ami = "${lookup(var.amis_docker_node, "${var.region}")}"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-3")}"
	instance_type = "${lookup(var.ec2-instance-type, "${var.environment-size}.build")}"
	key_name = "${var.aws_key_name}"
	security_groups = ["${aws_security_group.private_build.id}"]
	subnet_id = "${aws_subnet.az-3-private.id}",
	provisioner "local-exec" {
       command = "echo "
    }

	tags {
        Name = "jra-instance.swarm-worker.build.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-3")}",
        com.jra.environment = "${var.environment}"
        com.jra.environment_type = "${var.environment_type}"
        com.jra.environment-instance-id = "${random_id.env-instance.b64}"
    	com.jra.failure_zone = "${var.region}-az-3"
    	com.jra.environment-size = "${var.environment-size}"
    	com.jra.swarm-instance-type = "swarm-worker"
    	com.jra.swarm-node-type = "build"
    	com.jra.subnet-type = "private"
    }
}

# ---------------------------------------------------------------------------
# Swarm Node Instances for REST API Services
#  - EC2 Instances for across 3 avail zones
# ---------------------------------------------------------------------------
resource "aws_instance" "app-api-service-az-1" {
	ami = "${lookup(var.amis_docker_node, "${var.region}")}"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-1")}"
	instance_type = "${lookup(var.ec2-instance-type, "${var.environment-size}.app-api-service")}"
	key_name = "${var.aws_key_name}"
	security_groups = ["${aws_security_group.private_app-api-service.id}"]
	subnet_id = "${aws_subnet.az-1-private.id}",
	provisioner "local-exec" {
       command = "echo "
    }

	tags {
        Name = "jra-instance.swarm-worker.app-api-service.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-1")}",
        com.jra.environment = "${var.environment}"
        com.jra.environment_type = "${var.environment_type}"
        com.jra.environment-instance-id = "${random_id.env-instance.b64}"
    	com.jra.failure_zone = "${var.region}-az-1"
    	com.jra.environment-size = "${var.environment-size}"
    	com.jra.swarm-instance-type = "swarm-worker"
    	com.jra.swarm-node-type = "app-api-service"
    	com.jra.subnet-type = "private"
    }
}
resource "aws_instance" "app-api-service-az-2" {
	ami = "${lookup(var.amis_docker_node, "${var.region}")}"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-2")}"
	instance_type = "${lookup(var.ec2-instance-type, "${var.environment-size}.app-api-service")}"
	key_name = "${var.aws_key_name}"
	security_groups = ["${aws_security_group.private_app-api-service.id}"]
	subnet_id = "${aws_subnet.az-2-private.id}",
	provisioner "local-exec" {
       command = "echo "
    }

	tags {
        Name = "jra-instance.swarm-worker.app-api-service.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-2")}",
        com.jra.environment = "${var.environment}"
        com.jra.environment_type = "${var.environment_type}"
        com.jra.environment-instance-id = "${random_id.env-instance.b64}"
    	com.jra.failure_zone = "${var.region}-az-2"
    	com.jra.environment-size = "${var.environment-size}"
    	com.jra.swarm-instance-type = "swarm-worker"
    	com.jra.swarm-node-type = "app-api-service"
    	com.jra.subnet-type = "private"
    }
}
resource "aws_instance" "app-api-service-az-3" {
	ami = "${lookup(var.amis_docker_node, "${var.region}")}"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-3")}"
	instance_type = "${lookup(var.ec2-instance-type, "${var.environment-size}.app-api-service")}"
	key_name = "${var.aws_key_name}"
	security_groups = ["${aws_security_group.private_app-api-service.id}"]
	subnet_id = "${aws_subnet.az-3-private.id}",
	provisioner "local-exec" {
       command = "echo "
    }

	tags {
        Name = "jra-instance.swarm-worker.app-api-service.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-3")}",
        com.jra.environment = "${var.environment}"
        com.jra.environment_type = "${var.environment_type}"
        com.jra.environment-instance-id = "${random_id.env-instance.b64}"
    	com.jra.failure_zone = "${var.region}-az-3"
    	com.jra.environment-size = "${var.environment-size}"
    	com.jra.swarm-instance-type = "swarm-worker"
    	com.jra.swarm-node-type = "app-api-service"
    	com.jra.subnet-type = "private"
    }
}

# ---------------------------------------------------------------------------
# Swarm Node Instances for App Persistence - Databases, etc.
#  - EC2 Instances for across 3 avail zones
# ---------------------------------------------------------------------------
resource "aws_instance" "app-persistence-az-1" {
	ami = "${lookup(var.amis_docker_node, "${var.region}")}"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-1")}"
	instance_type = "${lookup(var.ec2-instance-type, "${var.environment-size}.app-persistence")}"
	key_name = "${var.aws_key_name}"
	security_groups = ["${aws_security_group.private_app-persistence.id}"]
	subnet_id = "${aws_subnet.az-1-private.id}",
	provisioner "local-exec" {
       command = "echo "
    }

	tags {
        Name = "jra-instance.swarm-worker.app-persistence.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-1")}",
        com.jra.environment = "${var.environment}"
        com.jra.environment_type = "${var.environment_type}"
        com.jra.environment-instance-id = "${random_id.env-instance.b64}"
    	com.jra.failure_zone = "${var.region}-az-1"
    	com.jra.environment-size = "${var.environment-size}"
    	com.jra.swarm-instance-type = "swarm-worker"
    	com.jra.swarm-node-type = "app-persistence"
    	com.jra.subnet-type = "private"
    }
}
resource "aws_instance" "app-persistence-az-2" {
	ami = "${lookup(var.amis_docker_node, "${var.region}")}"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-2")}"
	instance_type = "${lookup(var.ec2-instance-type, "${var.environment-size}.app-persistence")}"
	key_name = "${var.aws_key_name}"
	security_groups = ["${aws_security_group.private_app-persistence.id}"]
	subnet_id = "${aws_subnet.az-2-private.id}",
	provisioner "local-exec" {
       command = "echo "
    }

	tags {
        Name = "jra-instance.swarm-worker.app-persistence.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-2")}",
        com.jra.environment = "${var.environment}"
        com.jra.environment_type = "${var.environment_type}"
        com.jra.environment-instance-id = "${random_id.env-instance.b64}"
    	com.jra.failure_zone = "${var.region}-az-2"
    	com.jra.environment-size = "${var.environment-size}"
    	com.jra.swarm-instance-type = "swarm-worker"
    	com.jra.swarm-node-type = "app-persistence"
    	com.jra.subnet-type = "private"
    }
}
resource "aws_instance" "app-persistence-az-3" {
	ami = "${lookup(var.amis_docker_node, "${var.region}")}"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-3")}"
	instance_type = "${lookup(var.ec2-instance-type, "${var.environment-size}.app-persistence")}"
	key_name = "${var.aws_key_name}"
	security_groups = ["${aws_security_group.private_app-persistence.id}"]
	subnet_id = "${aws_subnet.az-3-private.id}",
	provisioner "local-exec" {
       command = "echo "
    }

	tags {
        Name = "jra-instance.swarm-worker.app-persistence.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-3")}",
        com.jra.environment = "${var.environment}"
        com.jra.environment_type = "${var.environment_type}"
        com.jra.environment-instance-id = "${random_id.env-instance.b64}"
    	com.jra.failure_zone = "${var.region}-az-3"
    	com.jra.environment-size = "${var.environment-size}"
    	com.jra.swarm-instance-type = "swarm-worker"
    	com.jra.swarm-node-type = "app-persistence"
    	com.jra.subnet-type = "private"
    }
}
