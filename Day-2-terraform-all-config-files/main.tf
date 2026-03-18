resource "aws_instance" "name" {
    ami = var.ami_id
    instance_type = var.instance_type
    tags = {
      name = "dev-instance"
    }
  
}
resource "aws_s3_bucket" "name" {
  bucket = "dev-bucket-vvffeerauod"
  tags = {
    name = "dev-bucket"
  }
  
}

