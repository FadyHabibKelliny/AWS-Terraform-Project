resource "aws_instance" "wec2_app" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = aws_subnet.private_subnet1
  vpc_security_group_ids = []

  tags = {
    Name = "HelloWorld"
  }
}