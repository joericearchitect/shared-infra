# ---------------------------------------------------------------------------
# Set Environment Instance Id
# ---------------------------------------------------------------------------
resource "random_id" "env-instance" {
  byte_length = 8
}

# ---------------------------------------------------------------------------
# VPC
# ---------------------------------------------------------------------------
resource "aws_vpc" "jra_vpc" {
	cidr_block = "${var.vpc_cidr}",
	enable_dns_support = "true",
	enable_dns_hostnames  = "true",

	tags {
        Name = "jra-vpc-${var.environment}-${var.region}",
        jra.environment = "${var.environment}",
        jra.environment_type = "${var.environment_type}",
    	jra.environment-size = "${var.environment-size}",
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    }
}

# ---------------------------------------------------------------------------
# Internet Gateway
# ---------------------------------------------------------------------------
resource "aws_internet_gateway" "jra_igw" {
	vpc_id = "${aws_vpc.jra_vpc.id}",

	tags {
        Name = "jra-igw-${var.environment}-${var.region}",
        jra.environment = "${var.environment}"
        jra.environment_type = "${var.environment_type}",
    	jra.environment-size = "${var.environment-size}",
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    }
}

# ---------------------------------------------------------------------------
# Routing table for public subnets
# ---------------------------------------------------------------------------
resource "aws_route_table" "public" {
	vpc_id = "${aws_vpc.jra_vpc.id}"

	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.jra_igw.id}"
	},

	tags {
        Name = "jra-route-table-${var.environment}-${var.region}-public",
        jra.environment = "${var.environment}"
        jra.environment_type = "${var.environment_type}",
    	jra.environment-size = "${var.environment-size}",
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    }
}

# ---------------------------------------------------------------------------
# Routing table for public subnets
# ---------------------------------------------------------------------------
resource "aws_route_table" "private" {
	vpc_id = "${aws_vpc.jra_vpc.id}"

	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.jra_igw.id}"
	},

	tags {
        Name = "jra-route-table-${var.environment}-${var.region}-private",
        jra.environment = "${var.environment}"
        jra.environment_type = "${var.environment_type}",
    	jra.environment-size = "${var.environment-size}",
        jra.environment-instance-id = "${random_id.env-instance.b64}"
    }
}
