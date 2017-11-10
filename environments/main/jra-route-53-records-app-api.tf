# ---------------------------------------------------------------------------
# Route 53 Records
#   Will add records to the route 53 domain
# ---------------------------------------------------------------------------
resource "aws_route53_record" "api" {
    zone_id = "${var.jra-domain-hosted-zone-id}"
    name = "${var.environment-domain-prefix}api.${var.jra-domain-name}"
    type = "A"

    alias {
      name = "${aws_elb.elb-public-app-api.dns_name}"
      zone_id = "${aws_elb.elb-public-app-api.zone_id}"
      evaluate_target_health = true
    }
}
