
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
        environment = "${var.environment}"
        environment_type = "${var.environment_type}"
    	failure_zone = "${var.region}-az-1"
    	environment-size = "${var.environment-size}"
    	swarm-instance-type = "swarm-manager"
    	swarm-node-type = "swarm-manager"
    	subnet-type = "private"
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
        environment = "${var.environment}"
        environment_type = "${var.environment_type}"
    	failure_zone = "${var.region}-az-2"
    	environment-size = "${var.environment-size}"
    	swarm-instance-type = "swarm-manager"
    	swarm-node-type = "swarm-manager"
    	subnet-type = "private"
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
        environment = "${var.environment}"
        environment_type = "${var.environment_type}"
    	failure_zone = "${var.region}-az-3"
    	environment-size = "${var.environment-size}"
    	swarm-instance-type = "swarm-manager"
    	swarm-node-type = "swarm-manager"
    	subnet-type = "private"
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
        Name = "jra-instance.swarm-node.build.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-1")}",
        environment = "${var.environment}"
        environment_type = "${var.environment_type}"
    	failure_zone = "${var.region}-az-1"
    	environment-size = "${var.environment-size}"
    	swarm-instance-type = "swarm-node"
    	swarm-node-type = "build"
    	subnet-type = "private"
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
        Name = "jra-instance.swarm-node.build.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-2")}",
        environment = "${var.environment}"
        environment_type = "${var.environment_type}"
    	failure_zone = "${var.region}-az-2"
    	environment-size = "${var.environment-size}"
    	swarm-instance-type = "swarm-node"
    	swarm-node-type = "build"
    	subnet-type = "private"
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
        Name = "jra-instance.swarm-node.build.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-3")}",
        environment = "${var.environment}"
        environment_type = "${var.environment_type}"
    	failure_zone = "${var.region}-az-3"
    	environment-size = "${var.environment-size}"
    	swarm-instance-type = "swarm-node"
    	swarm-node-type = "build"
    	subnet-type = "private"
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
        Name = "jra-instance.swarm-node.app-api-service.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-1")}",
        environment = "${var.environment}"
        environment_type = "${var.environment_type}"
    	failure_zone = "${var.region}-az-1"
    	environment-size = "${var.environment-size}"
    	swarm-instance-type = "swarm-node"
    	swarm-node-type = "app-api-service"
    	subnet-type = "private"
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
        Name = "jra-instance.swarm-node.app-api-service.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-2")}",
        environment = "${var.environment}"
        environment_type = "${var.environment_type}"
    	failure_zone = "${var.region}-az-2"
    	environment-size = "${var.environment-size}"
    	swarm-instance-type = "swarm-node"
    	swarm-node-type = "app-api-service"
    	subnet-type = "private"
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
        Name = "jra-instance.swarm-node.app-api-service.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-3")}",
        environment = "${var.environment}"
        environment_type = "${var.environment_type}"
    	failure_zone = "${var.region}-az-3"
    	environment-size = "${var.environment-size}"
    	swarm-instance-type = "swarm-node"
    	swarm-node-type = "app-api-service"
    	subnet-type = "private"
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
        Name = "jra-instance.swarm-node.app-persistence.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-1")}",
        environment = "${var.environment}"
        environment_type = "${var.environment_type}"
    	failure_zone = "${var.region}-az-1"
    	environment-size = "${var.environment-size}"
    	swarm-instance-type = "swarm-node"
    	swarm-node-type = "app-persistence"
    	subnet-type = "private"
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
        Name = "jra-instance.swarm-node.app-persistence.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-2")}",
        environment = "${var.environment}"
        environment_type = "${var.environment_type}"
    	failure_zone = "${var.region}-az-2"
    	environment-size = "${var.environment-size}"
    	swarm-instance-type = "swarm-node"
    	swarm-node-type = "app-persistence"
    	subnet-type = "private"
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
        Name = "jra-instance.swarm-node.app-persistence.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-3")}",
        environment = "${var.environment}"
        environment_type = "${var.environment_type}"
    	failure_zone = "${var.region}-az-3"
    	environment-size = "${var.environment-size}"
    	swarm-instance-type = "swarm-node"
    	swarm-node-type = "app-persistence"
    	subnet-type = "private"
    }
}
