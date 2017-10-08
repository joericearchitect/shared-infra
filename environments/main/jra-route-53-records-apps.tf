# ---------------------------------------------------------------------------
# Route 53 Records
#   Will add records to the route 53 domain
# ---------------------------------------------------------------------------
resource "aws_route53_record" "www" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}www.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-swarm.dns_name}"
      zone_id = "${aws_elb.elb-public-swarm.zone_id}"
      evaluate_target_health = true
    }
}

resource "aws_route53_record" "blog" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}blog.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-swarm.dns_name}"
      zone_id = "${aws_elb.elb-public-swarm.zone_id}"
      evaluate_target_health = true
    }
}
