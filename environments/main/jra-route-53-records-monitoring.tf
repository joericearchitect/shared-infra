# ---------------------------------------------------------------------------
# Route 53 Records
#   Will add records to the route 53 domain
# ---------------------------------------------------------------------------
resource "aws_route53_record" "grafana" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}grafana.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-monitoring.dns_name}"
      zone_id = "${aws_elb.elb-public-monitoring.zone_id}"
      evaluate_target_health = true
    }
}
resource "aws_route53_record" "cadvisor" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}cadvisor.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-monitoring.dns_name}"
      zone_id = "${aws_elb.elb-public-monitoring.zone_id}"
      evaluate_target_health = true
    }
}
resource "aws_route53_record" "alert" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}alerts.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-monitoring.dns_name}"
      zone_id = "${aws_elb.elb-public-monitoring.zone_id}"
      evaluate_target_health = true
    }
}
resource "aws_route53_record" "unsee" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}unsee.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-monitoring.dns_name}"
      zone_id = "${aws_elb.elb-public-monitoring.zone_id}"
      evaluate_target_health = true
    }
}
resource "aws_route53_record" "prometheus" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}prometheus.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-monitoring.dns_name}"
      zone_id = "${aws_elb.elb-public-monitoring.zone_id}"
      evaluate_target_health = true
    }
}
resource "aws_route53_record" "monitoring-proxy" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}monitoring-proxy.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-monitoring.dns_name}"
      zone_id = "${aws_elb.elb-public-monitoring.zone_id}"
      evaluate_target_health = true
    }
}