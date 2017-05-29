# ---------------------------------------------------------------------------
# Build - Swarm Node Instances
#  - EC2 Instances for across 3 avail zones
# ---------------------------------------------------------------------------
resource "aws_instance" "swarm-manager-az-1" {
	ami = "${lookup(var.amis_docker_node, "${var.region}")}"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-1")}"
	instance_type = "${lookup(var.ec2-instance-type, "${var.environment-size}.swarm-manager")}"
	key_name = "${var.aws_key_name}"
	security_groups = ["${aws_security_group.public_swarm-manager.id}"]
	subnet_id = "${aws_subnet.az-1-public.id}",
	provisioner "local-exec" {
       command = "echo "
    }

	tags {
        Name = "${var.environment}.instance.swarm-manager.infra-swarm-manager.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-1")}",
        jra.instance-name-full = "${var.environment}.instance.swarm-manager.infra-swarm-manager.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-1")}"
        jra.instance-name = "infra-swarm-worker-${var.region}-az-1"
        jra.environment = "${var.environment}"
        jra.environment_type = "${var.environment_type}"
    	jra.failure-zone = "${var.region}-az-1"
    	jra.environment-size = "${var.environment-size}"
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    	jra.swarm-instance-type = "swarm-manager"
    	jra.swarm-node-type = "infra-swarm-manager"
    	jra.subnet-type = "public"
    }
}