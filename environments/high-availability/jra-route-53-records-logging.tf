# ---------------------------------------------------------------------------
# Route 53 Records
#   Will add records to the route 53 domain
# ---------------------------------------------------------------------------
resource "aws_route53_record" "kibana" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}kibana.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-logging.dns_name}"
      zone_id = "${aws_elb.elb-public-logging.zone_id}"
      evaluate_target_health = true
    }
}
resource "aws_route53_record" "fluentd" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}fluentd.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-logging.dns_name}"
      zone_id = "${aws_elb.elb-public-logging.zone_id}"
      evaluate_target_health = true
    }
}
resource "aws_route53_record" "elasticsearch" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}es.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-logging.dns_name}"
      zone_id = "${aws_elb.elb-public-logging.zone_id}"
      evaluate_target_health = true
    }
}
resource "aws_route53_record" "logging-proxy" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}logging-proxy.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-logging.dns_name}"
      zone_id = "${aws_elb.elb-public-logging.zone_id}"
      evaluate_target_health = true
    }
}