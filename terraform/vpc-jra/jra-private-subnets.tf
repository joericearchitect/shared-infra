# ---------------------------------------------------------------------------
# Private Subnets
#  - private subnets
#  - route table for subnets
#  - route table associations to all private subnets
# ---------------------------------------------------------------------------
resource "aws_subnet" "us-east-1a-private" {
	vpc_id = "${aws_vpc.jra_vpc.id}"

	cidr_block = "10.0.1.0/24"
	availability_zone = "us-east-1a",

	tags {
        Name = "jra-subnet-${var.environment}-${var.region}-1a-private",
        environment = "${var.environment}"
    }
}

resource "aws_subnet" "us-east-1b-private" {
	vpc_id = "${aws_vpc.jra_vpc.id}"

	cidr_block = "10.0.3.0/24"
	availability_zone = "us-east-1b",

	tags {
        Name = "jra-subnet-${var.environment}-${var.region}-1b-private",
        environment = "${var.environment}"
    }
}

resource "aws_subnet" "us-east-1c-private" {
	vpc_id = "${aws_vpc.jra_vpc.id}"

	cidr_block = "10.0.5.0/24"
	availability_zone = "us-east-1c",

	tags {
        Name = "jra-subnet-${var.environment}-${var.region}-1c-private",
        environment = "${var.environment}"
    }
}
