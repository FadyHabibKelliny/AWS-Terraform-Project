
# ----------------- create public subnet  az1 ---------------

resource "aws_subnet" "public_subnet1" {
  vpc_id            = aws_vpc.iti_vpc.id
  cidr_block        = var.public_subnet1_cidr
  availability_zone = "${var.region}a"
  tags = {
    Name = "${var.COMPANY_NAME}_pub-subent-1"
  }
}

# ----------------- create public subnet  az2 ---------------
resource "aws_subnet" "public_subnet2" {
  vpc_id            = aws_vpc.iti_vpc.id
  cidr_block        = var.public_subnet2_cidr
  availability_zone = "${var.region}b"
  tags = {
    Name = "${var.COMPANY_NAME}_pub-subent-2"
  }
}


