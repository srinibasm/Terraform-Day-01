terraform {
  backend "s3" {
    bucket = "silan-s3-2233"
    region = "us-east-2"
    key = "terraform.tfstate"
    use_lockfile = true
    
  }
}