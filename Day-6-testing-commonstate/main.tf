resource "aws_instance" "name" {
  ami           = "ami-0b0b78dcacbab728f"
  instance_type = "t2.medium"

  tags = {
    Name = "papan_instance"
  }
}
