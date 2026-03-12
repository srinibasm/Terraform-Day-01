terraform {
  backend "s3" {
    bucket = "silon-s3-bucket"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}
