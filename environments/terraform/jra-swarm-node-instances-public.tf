# ---------------------------------------------------------------------------
# Build - Swarm Node Instances
#  - EC2 Instances for across 3 avail zones
# ---------------------------------------------------------------------------
resource "aws_instance" "app-ui-web-az-1" {
	ami = "${lookup(var.amis_docker_node, "${var.region}")}"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-1")}"
	instance_type = "${lookup(var.ec2-instance-type, "${var.environment-size}.app-ui-web")}"
	key_name = "${var.aws_key_name}"
	security_groups = ["${aws_security_group.public_app-ui-web.id}"]
	subnet_id = "${aws_subnet.az-1-public.id}",
	provisioner "local-exec" {
       command = "echo "
    }

	tags {
        Name = "jra-instance.swarm-worker.app-ui-web.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-1")}",
        environment = "${var.environment}"
        environment_type = "${var.environment_type}"
    	failure_zone = "${var.region}-az-1"
    	environment-size = "${var.environment-size}"
        environment-instance-id = "${random_id.env-instance.b64}"
    	swarm-instance-type = "swarm-worker"
    	swarm-node-type = "app-ui-web"
    	subnet-type = "public"
    }
}
resource "aws_instance" "app-ui-web-az-2" {
	ami = "${lookup(var.amis_docker_node, "${var.region}")}"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-2")}"
	instance_type = "${lookup(var.ec2-instance-type, "${var.environment-size}.app-ui-web")}"
	key_name = "${var.aws_key_name}"
	security_groups = ["${aws_security_group.public_app-ui-web.id}"]
	subnet_id = "${aws_subnet.az-2-public.id}",
	provisioner "local-exec" {
       command = "echo "
    }

	tags {
        Name = "jra-instance.swarm-worker.app-ui-web.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-2")}",
        environment = "${var.environment}"
        environment_type = "${var.environment_type}"
        environment-instance-id = "${random_id.env-instance.b64}"
    	failure_zone = "${var.region}-az-2"
    	environment-size = "${var.environment-size}"
    	swarm-instance-type = "swarm-worker"
    	swarm-node-type = "app-ui-web"
    	subnet-type = "public"
    }
}
resource "aws_instance" "app-ui-web-az-3" {
	ami = "${lookup(var.amis_docker_node, "${var.region}")}"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-3")}"
	instance_type = "${lookup(var.ec2-instance-type, "${var.environment-size}.app-ui-web")}"
	key_name = "${var.aws_key_name}"
	security_groups = ["${aws_security_group.public_app-ui-web.id}"]
	subnet_id = "${aws_subnet.az-3-public.id}",
	provisioner "local-exec" {
       command = "echo "
    }

	tags {
        Name = "jra-instance.swarm-worker.app-ui-web.${var.environment}.${lookup(var.availability_zone, "${var.region}.az-3")}",
        environment = "${var.environment}"
        environment_type = "${var.environment_type}"
        environment-instance-id = "${random_id.env-instance.b64}"
    	failure_zone = "${var.region}-az-3"
    	environment-size = "${var.environment-size}"
    	swarm-instance-type = "swarm-worker"
    	swarm-node-type = "app-ui-web"
    	subnet-type = "public"
    }
}
