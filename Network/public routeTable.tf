resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc_main.id

  route {
    cidr_block = var.ALL_ROUTE_IP4 #Destination from vpc main
    nat_gateway_id = aws_internet_gateway.igw.id #target nat gateway
  }

  route {
    cidr_block = var.ALL_ROUTE_IP6
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.COMPANY_NAME}_public-rtb"
  }
}