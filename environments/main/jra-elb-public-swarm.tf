resource "aws_security_group" "elb-public-swarm" {
	name = "${var.environment}.jra-sg.${var.region}-swarm-elb"
	description = "Security groups for public swarm elb"

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
        Name = "${var.environment}.sg.${var.region}-swarm-elb",
        jra.environment = "${var.environment}",
        jra.environment_type = "${var.environment_type}",
    	jra.environment-size = "${var.environment-size}",
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    }
}


# ---------------------------------------------------------------------------
# ELB
#   Will add all the public instances of the swarm node to this ELB
#   This is because the way docker swarm mode works, all exposed ports of all application containers will be made
#   avaialble from EVERY node in the cluster...even if there is no container with the application deployed there.
# ---------------------------------------------------------------------------
resource "aws_elb" "elb-public-swarm" {
    name = "${var.environment}-jra-elb-${var.region}-swarm"
    subnets = ["${aws_subnet.az-1-public.id}","${aws_subnet.az-2-public.id}","${aws_subnet.az-3-public.id}"]
    security_groups = ["${aws_security_group.elb-public-swarm.id}"]

    listener {
        instance_port = 80
        instance_protocol = "http"
        lb_port = 80
        lb_protocol = "http"
    }

    health_check {
        healthy_threshold = 4
        unhealthy_threshold = 4
        timeout = 3
        target = "TCP:80"
        interval = 15
    }

    instances = ["${aws_instance.app-ui-web-az-1.id}", "${aws_instance.app-ui-web-az-2.id}", "${aws_instance.app-ui-web-az-3.id}"]
    cross_zone_load_balancing = true
    idle_timeout = 400
    connection_draining = true
    connection_draining_timeout = 400

    tags {
        Name = "${var.environment}-jra-elb-${var.region}-swarm",
        jra.environment = "${var.environment}"
        jra.environment_type = "${var.environment_type}"
    	jra.environment-size = "${var.environment-size}"
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    }
}
