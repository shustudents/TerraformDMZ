provider "aws"{
  region = "us-east-1"
}

# vpc 

module "vpc" {

  source = "../dmz" 
  
}

