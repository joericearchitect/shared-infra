# ---------------------------------------------------------------------------
# Public Subnets
#  - public subnets
#  - route table for subnets
#  - route table associations to all public subnets
# ---------------------------------------------------------------------------
resource "aws_subnet" "us-east-1a-public" {
	vpc_id = "${aws_vpc.jra_vpc.id}"

	cidr_block = "10.0.0.0/24"
	availability_zone = "us-east-1a",

	tags {
        Name = "jra-subnet-${var.environment}-${var.region}-1a-public-webapp",
        environment = "${var.environment}"
    }
}

resource "aws_subnet" "us-east-1b-public" {
	vpc_id = "${aws_vpc.jra_vpc.id}"

	cidr_block = "10.0.2.0/24"
	availability_zone = "us-east-1b",

	tags {
        Name = "jra-subnet-${var.environment}-${var.region}-1b-public-webapp",
        environment = "${var.environment}"
    }
}

resource "aws_subnet" "us-east-1c-public" {
	vpc_id = "${aws_vpc.jra_vpc.id}"

	cidr_block = "10.0.4.0/24"
	availability_zone = "us-east-1c",

	tags {
        Name = "jra-subnet-${var.environment}-${var.region}-1c-public-webapp",
        environment = "${var.environment}"
    }
}
