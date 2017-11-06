# ---------------------------------------------------------------------------
# Route 53 Records
#   Will add records to the route 53 domain
# ---------------------------------------------------------------------------

resource "aws_route53_record" "build" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}build.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-swarm.dns_name}"
      zone_id = "${aws_elb.elb-public-swarm.zone_id}"
      evaluate_target_health = true
    }
}

resource "aws_route53_record" "dockerui" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}dockerui.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-swarm.dns_name}"
      zone_id = "${aws_elb.elb-public-swarm.zone_id}"
      evaluate_target_health = true
    }
}

resource "aws_route53_record" "docker" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}docker.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-swarm.dns_name}"
      zone_id = "${aws_elb.elb-public-swarm.zone_id}"
      evaluate_target_health = true
    }
}
resource "aws_route53_record" "proxy" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}proxy.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-swarm.dns_name}"
      zone_id = "${aws_elb.elb-public-swarm.zone_id}"
      evaluate_target_health = true
    }
}

resource "aws_route53_record" "dockervisual" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}dockervisual.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-swarm.dns_name}"
      zone_id = "${aws_elb.elb-public-swarm.zone_id}"
      evaluate_target_health = true
    }
}


resource "aws_route53_record" "jira" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}jira.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-swarm.dns_name}"
      zone_id = "${aws_elb.elb-public-swarm.zone_id}"
      evaluate_target_health = true
    }
}

resource "aws_route53_record" "wiki" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}wiki.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-swarm.dns_name}"
      zone_id = "${aws_elb.elb-public-swarm.zone_id}"
      evaluate_target_health = true
    }
}

resource "aws_route53_record" "nexus" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}nexus.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-swarm.dns_name}"
      zone_id = "${aws_elb.elb-public-swarm.zone_id}"
      evaluate_target_health = true
    }
}

resource "aws_route53_record" "sonar" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}sonar.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-swarm.dns_name}"
      zone_id = "${aws_elb.elb-public-swarm.zone_id}"
      evaluate_target_health = true
    }
}