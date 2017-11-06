# ---------------------------------------------------------------------------
# Swarm Manager Instances
#  - EC2 Instances for across 3 avail zones
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Build - Swarm Node Instances
#  - EC2 Instances for across 3 avail zones
# ---------------------------------------------------------------------------
resource "aws_instance" "swarm-manager-az-1" {
	ami = "${lookup(var.amis_docker_node, "${var.region}")}"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-1")}"
	instance_type = "${lookup(var.ec2-instance-type, "${var.environment-size}.swarm-manager")}"
	key_name = "${var.aws_key_name}"
	security_groups = ["${aws_security_group.private_swarm-manager.id}"]
	subnet_id = "${aws_subnet.az-1-private.id}",
	monitoring = "true",
	provisioner "local-exec" {
       command = "echo "
    }

	tags {
        Name = "${var.environment}.instance.swarm-manager.infra-swarm-manager.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-1")}",
        jra.instance-name-full = "${var.environment}.instance.swarm-manager.infra-swarm-manager.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-1")}"
        jra.instance-name = "infra-swarm-manager-${var.region}-az-1"
        jra.environment = "${var.environment}"
        jra.environment_type = "${var.environment_type}"
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    	jra.failure-zone = "${var.region}-az-1"
    	jra.environment-size = "${var.environment-size}"
    	jra.swarm-instance-type = "swarm-manager"
    	jra.swarm-node-type = "infra-swarm-manager"
    	jra.subnet-type = "private"
    }
}
resource "aws_instance" "infra-build-az-1" {
	ami = "${lookup(var.amis_docker_node, "${var.region}")}"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-1")}"
	instance_type = "${lookup(var.ec2-instance-type, "${var.environment-size}.infra-build")}"
	key_name = "${var.aws_key_name}"
	security_groups = ["${aws_security_group.private_infra-build.id}"]
	subnet_id = "${aws_subnet.az-1-private.id}",
	monitoring = "true",
	provisioner "local-exec" {
       command = "echo "
    }

	tags {
        Name = "${var.environment}.instance.swarm-worker.infra-build.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-1")}",
        jra.instance-name-full = "${var.environment}.instance.swarm-worker.infra-build.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-1")}"
        jra.instance-name = "infra-build-${var.region}-az-1"
        jra.environment = "${var.environment}"
        jra.environment_type = "${var.environment_type}"
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    	jra.failure-zone = "${var.region}-az-1"
    	jra.environment-size = "${var.environment-size}"
    	jra.swarm-instance-type = "swarm-worker"
    	jra.swarm-node-type = "infra-build"
    	jra.subnet-type = "private"
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
	monitoring = "true",
	provisioner "local-exec" {
       command = "echo "
    }

	tags {
        Name = "${var.environment}.instance.swarm-worker.app-persistence.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-1")}",
        jra.instance-name-full = "${var.environment}.instance.swarm-worker.app-persistence.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-1")}"
        jra.instance-name = "app-persistence-${var.region}-az-1"
        jra.environment = "${var.environment}"
        jra.environment_type = "${var.environment_type}"
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    	jra.failure-zone = "${var.region}-az-1"
    	jra.environment-size = "${var.environment-size}"
    	jra.swarm-instance-type = "swarm-worker"
    	jra.swarm-node-type = "app-persistence"
    	jra.subnet-type = "private"
    }
}

# ---------------------------------------------------------------------------
# Swarm Node Instances for Logging - FluentD, ElasticSearch, Kibana, etc.
#  - EC2 Instances for across 3 avail zones
# ---------------------------------------------------------------------------
resource "aws_instance" "infra-logging-az-1" {
	ami = "${lookup(var.amis_docker_node, "${var.region}")}"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-1")}"
	instance_type = "${lookup(var.ec2-instance-type, "${var.environment-size}.infra-logging")}"
	key_name = "${var.aws_key_name}"
	security_groups = ["${aws_security_group.private_infra-logging.id}"]
	subnet_id = "${aws_subnet.az-1-private.id}",
	monitoring = "true",
	provisioner "local-exec" {
       command = "echo "
    }

	tags {
        Name = "${var.environment}.instance.swarm-worker.infra-logging.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-1")}",
        jra.instance-name-full = "${var.environment}.instance.swarm-worker.infra-logging.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-1")}"
        jra.instance-name = "infra-logging-${var.region}-az-1"
        jra.environment = "${var.environment}"
        jra.environment_type = "${var.environment_type}"
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    	jra.failure-zone = "${var.region}-az-1"
    	jra.environment-size = "${var.environment-size}"
    	jra.swarm-instance-type = "swarm-worker"
    	jra.swarm-node-type = "infra-logging"
    	jra.subnet-type = "private"
    }
}

# ---------------------------------------------------------------------------
# Infra Persistence - Swarm Node Instances
#  - EC2 Instances for across 3 avail zones
# ---------------------------------------------------------------------------
resource "aws_instance" "infra-persistence-az-1" {
	ami = "${lookup(var.amis_docker_node, "${var.region}")}"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-1")}"
	instance_type = "${lookup(var.ec2-instance-type, "${var.environment-size}.infra-persistence")}"
	key_name = "${var.aws_key_name}"
	security_groups = ["${aws_security_group.private_infra-persistence.id}"]
	subnet_id = "${aws_subnet.az-1-private.id}",
	monitoring = "true",
	provisioner "local-exec" {
       command = "echo "
    }

	tags {
        Name = "${var.environment}.instance.swarm-worker.infra-persistence.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-1")}",
        jra.instance-name-full = "${var.environment}.instance.swarm-worker.infra-persistence.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-1")}"
        jra.instance-name = "infra-persistence-${var.region}-az-1"
        jra.environment = "${var.environment}"
        jra.environment_type = "${var.environment_type}"
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    	jra.failure-zone = "${var.region}-az-1"
    	jra.environment-size = "${var.environment-size}"
    	jra.swarm-instance-type = "swarm-worker"
    	jra.swarm-node-type = "infra-persistence"
    	jra.subnet-type = "private"
    }
}

# ---------------------------------------------------------------------------
# Infra UI Web - Swarm Node Instances
#  - EC2 Instances for across 3 avail zones
# ---------------------------------------------------------------------------
resource "aws_instance" "infra-repos-az-1" {
	ami = "${lookup(var.amis_docker_node, "${var.region}")}"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-1")}"
	instance_type = "${lookup(var.ec2-instance-type, "${var.environment-size}.infra-repos")}"
	key_name = "${var.aws_key_name}"
	security_groups = ["${aws_security_group.private_infra-repos.id}"]
	subnet_id = "${aws_subnet.az-1-private.id}",
	monitoring = "true",
	provisioner "local-exec" {
       command = "echo "
    }

	tags {
        Name = "${var.environment}.instance.swarm-worker.infra-repos.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-1")}",
        jra.instance-name-full = "${var.environment}.instance.swarm-worker.infra-repos.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-1")}"
        jra.instance-name = "infra-repos-${var.region}-az-1"
        jra.environment = "${var.environment}"
        jra.environment_type = "${var.environment_type}"
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    	jra.failure-zone = "${var.region}-az-1"
    	jra.environment-size = "${var.environment-size}"
    	jra.swarm-instance-type = "swarm-worker"
    	jra.swarm-node-type = "infra-repos"
    	jra.subnet-type = "private"
    }
}
