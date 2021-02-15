resource "aws_instance" "bmo-ec2-instance" {
  ami           = var.aws_ec2_ami
  instance_type = var.aws_ec2_instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id] 
  subnet_id = aws_subnet.bmo_public_subnet.id

  tags = {
    Name = "bmo-terraform-ec2-instance-${var.environment}"
  }
}


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.bmo_custom_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = var.https_port
    to_port     = var.https_port
    protocol    = var.tcp_protocol
    cidr_blocks = [aws_vpc.bmo_custom_vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.egress_cidr_block
  }

  tags = {
    Name = "allow_tls"
  }
}