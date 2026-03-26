variable "dev" {
    type = bool
    default = false
  
}


resource "aws_instance" "name" {
    ami = "ami-0b0b78dcacbab728f"
    instance_type = "t2.micro"
    count = var.dev ? 1 : 0
    #if dev is true then create 1 instance if false then create 0 instance
}