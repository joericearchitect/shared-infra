# ---------------------------------------------------------------------------
# NAT EIP
# ---------------------------------------------------------------------------
resource "aws_eip" "az-1-public" {
	vpc = true
}
resource "aws_eip" "az-2-public" {
	vpc = true
}
resource "aws_eip" "az-3-public" {
	vpc = true
}

# ---------------------------------------------------------------------------
# NAT Gateway
# ---------------------------------------------------------------------------

resource "aws_nat_gateway" "az-1-public" {
    allocation_id = "${aws_eip.az-1-public.id}"
    subnet_id = "${aws_subnet.az-1-public.id}"
}

resource "aws_nat_gateway" "az-2-public" {
    allocation_id = "${aws_eip.az-2-public.id}"
    subnet_id = "${aws_subnet.az-2-public.id}"
}

resource "aws_nat_gateway" "az-3-public" {
    allocation_id = "${aws_eip.az-3-public.id}"
    subnet_id = "${aws_subnet.az-3-public.id}"
}

