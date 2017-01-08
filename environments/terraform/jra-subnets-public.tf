# ---------------------------------------------------------------------------
# Public Subnets
#  - public subnets
#  - route table for subnets
#  - route table associations to all public subnets
# ---------------------------------------------------------------------------
resource "aws_subnet" "az-1-public" {
	vpc_id = "${aws_vpc.jra_vpc.id}"

	cidr_block = "10.0.0.0/24"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-1")}"
	map_public_ip_on_launch = "true"

	tags {
        Name = "jra-subnet-${var.environment}-${lookup(var.availability_zone, "${var.region}.az-1")}-public",
        environment = "${var.environment}"
        environment_type = "${var.environment_type}",
    	environment-size = "${var.environment-size}",
        environment-instance-id = "${random_id.env-instance.b64}"
    	failure_zone = "${var.region}-az-1"
    }
}

resource "aws_subnet" "az-2-public" {
	vpc_id = "${aws_vpc.jra_vpc.id}"

	cidr_block = "10.0.2.0/24"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-2")}",
	map_public_ip_on_launch = "true"

	tags {
        Name = "jra-subnet-${var.environment}-${lookup(var.availability_zone, "${var.region}.az-2")}-public",
        environment = "${var.environment}"
        environment_type = "${var.environment_type}",
    	environment-size = "${var.environment-size}",
        environment-instance-id = "${random_id.env-instance.b64}"
    	failure_zone = "${var.region}-az-2"
    }
}

resource "aws_subnet" "az-3-public" {
	vpc_id = "${aws_vpc.jra_vpc.id}"

	cidr_block = "10.0.4.0/24"
	availability_zone = "${lookup(var.availability_zone, "${var.region}.az-3")}",
	map_public_ip_on_launch = "true"

	tags {
        Name = "jra-subnet-${var.environment}-${lookup(var.availability_zone, "${var.region}.az-3")}-public",
        environment = "${var.environment}"
        environment_type = "${var.environment_type}",
    	environment-size = "${var.environment-size}",
        environment-instance-id = "${random_id.env-instance.b64}"
    	failure_zone = "${var.region}-az-3"
    }
}

# Associate public subnets to Internet Gateway routing table

resource "aws_route_table_association" "az-1-public" {
	subnet_id = "${aws_subnet.az-1-public.id}"
	route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "az-2-public" {
	subnet_id = "${aws_subnet.az-2-public.id}"
	route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "az-3-public" {
	subnet_id = "${aws_subnet.az-3-public.id}"
	route_table_id = "${aws_route_table.public.id}"
}
