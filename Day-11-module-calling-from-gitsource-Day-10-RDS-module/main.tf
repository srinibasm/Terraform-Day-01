module "rds" {
  source = "git::https://github.com/srinibasm/Terraform-Day-01.git//Day-10-RDS-module"

  vpc_cidr = "10.0.0.0/16"

  subnets = {
    subnet1 = {
      cidr = "10.0.0.0/24"
      az   = "us-east-2a"
    }
    subnet2 = {
      cidr = "10.0.1.0/24"
      az   = "us-east-2b"
    }
  }

  db_identifier         = "rds-test"
  db_name               = "mydb"
  db_instance_class     = "db.t3.micro"
  db_allocated_storage  = var.db_allocated_storage
  db_username           = var.db_username

  #note here db_username is passing value to module variable and var.db_username is declaired in variable.tf file and value is terraform.tfvars

  backup_window      = "02:00-03:00"
  maintenance_window = "sun:04:00-sun:05:00"
}