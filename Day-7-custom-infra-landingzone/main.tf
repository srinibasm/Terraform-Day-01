# creation of Vpc,Subnet, Internet Gateway, Route Table, Security Group, Nat Gateway, server

resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/16"
    tags = {
      name = "dev-vpc"
    }
  
}
 #public subnet
 resource "aws_subnet" "dev" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-2a"
    tags = {
      name = "dev-subnet"
    }
 }
  #private subnet
  resource "aws_subnet" "dev2" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-2a"
    tags = {
      name = "dev-subnet-2"
    }

    
  }
  resource "aws_eip" "dev" {
  domain = "vpc"
}
resource "aws_nat_gateway" "dev" {
  allocation_id = aws_eip.dev.id
  subnet_id     = aws_subnet.dev.id   # Public subnet

  tags = {
    Name = "dev-nat-gateway"
  }
}
  
  resource "aws_internet_gateway" "dev" {
    vpc_id = aws_vpc.dev.id
    tags = {
      name = "dev-igw"
    }
  }
  #route table for public subnet
  resource "aws_route_table" "dev" {
    vpc_id = aws_vpc.dev.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.dev.id
    }
    tags = {
    Name = "public-route-table"
  }
    
  }
  #route table association with public subnet
  resource "aws_route_table_association" "dev" {
    subnet_id = aws_subnet.dev.id
    route_table_id = aws_route_table.dev.id
    
  }
  #route table for private subnet
  resource "aws_route_table" "private" {
  vpc_id = aws_vpc.dev.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.dev.id
  }

  tags = {
    Name = "private-route-table"
  }
}
  
  #route table assciation with private subnet
  resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.dev2.id
  route_table_id = aws_route_table.private.id
}
 resource "aws_security_group" "dev" {
    name = "dev-sg"
    description = "Allow SSH and HTTP traffic"
    vpc_id = aws_vpc.dev.id

    #inbound rule to allow ssh traffic
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    #outbound rule to allow ssh traffic
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

 }
 resource "aws_instance" "dev" {
    ami = "ami-0b0b78dcacbab728f"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.dev.id
    vpc_security_group_ids = [aws_security_group.dev.id]
    tags = {
      name = "dev-instance"
    }
   
 }

