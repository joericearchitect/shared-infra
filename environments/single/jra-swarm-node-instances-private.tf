
# ---------------------------------------------------------------------------
# Swarm Manager Instances
#  - EC2 Instances for across 3 avail zones
# ---------------------------------------------------------------------------
resource "aws_instance" "swarm-worker-az-1" {
	ami = "${lookup(var.amis_docker_node, "${var.region}")}"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-1")}"
	instance_type = "${lookup(var.ec2-instance-type, "${var.environment-size}.swarm-worker")}"
	key_name = "${var.aws_key_name}"
	security_groups = ["${aws_security_group.private_swarm-worker.id}"]
	subnet_id = "${aws_subnet.az-1-private.id}",
	provisioner "local-exec" {
       command = "echo "
    }

	tags {
        Name = "${var.environment}.instance.swarm-worker.infra-swarm-worker.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-1")}",
        jra.environment = "${var.environment}"
        jra.environment_type = "${var.environment_type}"
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    	jra.failure-zone = "${var.region}-az-1"
    	jra.failure-zone = "${var.region}-az-2"
    	jra.failure-zone = "${var.region}-az-3"
    	jra.environment-size = "${var.environment-size}"
    	jra.swarm-instance-type = "swarm-worker"
    	jra.swarm-node-type = "infra-build"
    	jra.swarm-node-type = "infra-logging"
    	jra.swarm-node-type = "app-ui-web"
    	jra.swarm-node-type = "app-api-service"
    	jra.swarm-node-type = "app-persistence"
    	jra.subnet-type = "private"
    }
}


