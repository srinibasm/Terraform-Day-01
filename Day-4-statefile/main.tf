resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/24"
    tags = {
      name = "papan"
    }
  
}
resource "aws_instance" "name" {
  ami           = "ami-0b0b78dcacbab728f"
  instance_type = "t2.micro"

  tags = {
    Name = "papan_instance"
  }
}