provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type 
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name               = var.key_name

  associate_public_ip_address = var.public_ip

  monitoring = var.enable_monitoring

  root_block_device {
    volume_size = var.root_volume_size
  }

  tags = var.tags
}