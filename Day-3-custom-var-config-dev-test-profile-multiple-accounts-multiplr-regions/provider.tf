provider "aws" {
    region = "us-east-2"
    profile = "default"
#here dev = default profile in provider.tf
  
}
#calling keys from my local machine dev credentials
## dev environment provider block ##
provider "aws" {
    region = "us-east-2"
    alias = "testenv"
    profile = "dev"
  
}
#calling keys from my local machine prod credentials
## prod environment provider block ##
provider "aws" {
    region = "us-east-2"
    alias = "prodenv"
    profile = "prod"
  
}