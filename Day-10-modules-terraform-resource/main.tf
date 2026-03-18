module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type = "t3.micro"
  subnet_id = "subnet-01d56ca1597194dba"
  
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}