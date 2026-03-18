# i am passing the values form Day-9 to Day-2 so source code exist into day-2 for reusability
  module "dev" {
    source = "../Day-2-terraform-all-config-files"
    ami_id = "ami-0b0b78dcacbab728f"
    instance_type = "t2.micro"
  }