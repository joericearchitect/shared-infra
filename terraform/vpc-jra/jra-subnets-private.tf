
# ---------------------------------------------------------------------------
# Private Subnets
#  - private subnets
#  - route table for subnets
#  - route table associations to all private subnets
# ---------------------------------------------------------------------------
resource "aws_subnet" "az-1-private" {
	vpc_id = "${aws_vpc.jra_vpc.id}"

	cidr_block = "10.0.1.0/24"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-1")}",
	map_public_ip_on_launch = "true"

	tags {
        Name = "jra-subnet-${var.environment}-${lookup(var.availability_zone, "${var.region}.az-1")}-private",
        environment = "${var.environment}"
    	failure_zone = "${var.region}-az-1"
    }
}

resource "aws_subnet" "az-2-private" {
	vpc_id = "${aws_vpc.jra_vpc.id}"

	cidr_block = "10.0.3.0/24"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-2")}",
	map_public_ip_on_launch = "true"

	tags {
        Name = "jra-subnet-${var.environment}-${lookup(var.availability_zone, "${var.region}.az-2")}-private",
        environment = "${var.environment}"
    	failure_zone = "${var.region}-az-2"
    }
}

resource "aws_subnet" "az-3-private" {
	vpc_id = "${aws_vpc.jra_vpc.id}"

	cidr_block = "10.0.5.0/24"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-3")}",
	map_public_ip_on_launch = "true"

	tags {
        Name = "jra-subnet-${var.environment}-${lookup(var.availability_zone, "${var.region}.az-3")}-private",
        environment = "${var.environment}"
    	failure_zone = "${var.region}-az-3"
    }
}
