provider "aws" {
  region = "us-east-1"
}


 module "vpc" {
  source       = "../Modules/dmz"
  vpc_cidr     = "10.0.0.0/16"
  vpc_frontend = "10.0.1.0/24"
  vpc_applayer = "10.0.2.0/24"
  vpc_database = "10.0.3.0/24"
}

#module "policies" {
#  source              = "../Modules/IAM"
#  account_number_root = "592662970146"
#}
