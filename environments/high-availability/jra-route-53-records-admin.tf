# ---------------------------------------------------------------------------
# Route 53 Records
#   Will add records to the route 53 domain
# ---------------------------------------------------------------------------

resource "aws_route53_record" "build" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}build.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-admin.dns_name}"
      zone_id = "${aws_elb.elb-public-admin.zone_id}"
      evaluate_target_health = true
    }
}

resource "aws_route53_record" "dockerui" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}dockerui.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-admin.dns_name}"
      zone_id = "${aws_elb.elb-public-admin.zone_id}"
      evaluate_target_health = true
    }
}

resource "aws_route53_record" "docker" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}docker.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-admin.dns_name}"
      zone_id = "${aws_elb.elb-public-admin.zone_id}"
      evaluate_target_health = true
    }
}
resource "aws_route53_record" "proxy" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}proxy.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-admin.dns_name}"
      zone_id = "${aws_elb.elb-public-admin.zone_id}"
      evaluate_target_health = true
    }
}

resource "aws_route53_record" "dockervisual" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}dockervisual.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-admin.dns_name}"
      zone_id = "${aws_elb.elb-public-admin.zone_id}"
      evaluate_target_health = true
    }
}
