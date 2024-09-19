# Create Elastic IP
resource "aws_eip" "lb" {
  domain   = "VPC"
}

# Create NAT Gateway
resource "aws_nat_gateway" "NAT-GW" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.public_subnet1.id

  tags = {
    Name = "${var.COMPANY_NAME}_nat_GW"
  }

  depends_on = [aws_internet_gateway.igw]
}