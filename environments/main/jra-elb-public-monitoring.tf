
resource "aws_security_group" "elb-public-monitoring" {
	name = "${var.environment}.jra-sg.${var.region}-monitoring-elb"
	description = "Security groups for public monitoring elb"

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
        Name = "${var.environment}.sg.${var.region}-monitor-elb",
        jra.environment = "${var.environment}",
        jra.environment_type = "${var.environment_type}",
    	jra.environment-size = "${var.environment-size}",
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    }
}


resource "aws_elb" "elb-public-monitoring" {
    name = "${var.environment}-jra-elb-${var.region}-monitor"
    subnets = ["${aws_subnet.az-1-public.id}"]
    security_groups = ["${aws_security_group.elb-public-monitoring.id}"]

    listener {
        instance_port = 82
        instance_protocol = "tcp"
        lb_port = 80
        lb_protocol = "tcp"
    }

    health_check {
        healthy_threshold = 4
        unhealthy_threshold = 4
        timeout = 3
        target = "TCP:81"
        interval = 15
    }

    instances = ["${aws_instance.swarm-manager-az-1.id}", "${aws_instance.infra-monitoring-az-1.id}"]
    cross_zone_load_balancing = true
    idle_timeout = 400
    connection_draining = true
    connection_draining_timeout = 400

    tags {
        Name = "${var.environment}-jra-elb-${var.region}-monitor",
        jra.environment = "${var.environment}"
        jra.environment_type = "${var.environment_type}"
    	jra.environment-size = "${var.environment-size}"
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    }
}