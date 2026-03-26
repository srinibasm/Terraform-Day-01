variable "create_special_resource" {
  type = bool
  default = false
}


resource "aws_instance" "name" {
    ami = "ami-0b0b78dcacbab728f"
    instance_type = "t2.micro"
  
}
resource "aws_s3_bucket" "name" {
    bucket = "silon-s3-bucketosdijf"
  
}

#terraform plan -target=aws_instance.name
#if multiple resource we can use -target multiple times
#terraform plan -target=aws_instance.name -target=aws_s3_bucket.name 