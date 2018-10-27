provider "aws"{
  region = "us-east-1"
}

# vpc 

module "vpc" {

  source = "../dmz" 
  vpc_cidr = "10.0.0.0/16" 
  
}

