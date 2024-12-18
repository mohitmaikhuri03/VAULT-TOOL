resource "aws_instance" "public_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.public_sg_id]
  tags = {
    Name = "public-instance"
  }
}

resource "aws_instance" "vault" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.private_sg_id]
  key_name               = var.key_name
  tags = {
    Name = "Vault"
  }
}

resource "aws_instance" "consul" {
  count                  = var.consul_instance_count
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [var.private_sg_id]
  tags = {
    Name = "consul"
  }
}
