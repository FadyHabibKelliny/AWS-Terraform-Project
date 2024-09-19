resource "aws_security_group" "public-sg" {
  name        = "public-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc_main.id

  tags = {
    Name = "public-sg"
  }
}

# rule for allowing ssh traffic for public sg
resource "aws_vpc_security_group_ingress_rule" "ingress_public-sg_ipv4" {
  security_group_id = aws_security_group.public-sg.id
  cidr_ipv4         = aws_vpc.vpc_main.VPC_CIDR
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

# rule for allowing all outgoing traffic
resource "aws_vpc_security_group_egress_rule" "egress-public-sg_ipv4" {
  security_group_id = aws_security_group.public-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_security_group" "private-sg" {
  name        = "private-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "private-sg"
  }
}

# rule for allowing ssh traffic for public sg
resource "aws_vpc_security_group_ingress_rule" "ingress-private-sg_ipv4" {
  security_group_id = aws_security_group.private-sg.id
  cidr_ipv4         = aws_vpc.vpc_main.VPC_CIDR
  from_port         = var.Private_PORT
  ip_protocol       = "tcp"
  to_port           = var.Private_PORT
}

# rule for allowing all outgoing traffic
resource "aws_vpc_security_group_egress_rule" "egress-private-sg_ipv4" {
  security_group_id = aws_security_group.private-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}