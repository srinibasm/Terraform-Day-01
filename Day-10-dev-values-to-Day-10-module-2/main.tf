module "dev" {
  source = "../Day-10-module-2"

  ami_id             = "ami-0b0b78dcacbab728f"
  instance_type      = "t2.micro"
  subnet_id          = "subnet-01d56ca1597194dba"
  security_group_ids = ["sg-018694163c8dad1b3"]
  key_name           = "silon"

  tags = {
    Environment = "dev"
  }
}