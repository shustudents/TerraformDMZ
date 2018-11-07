#variables file for dmz
variable "vpc_cidr" {
  description = "cidr block for vpc" 
  default = "10.0.0.0/16"
}

#variables for front end
variable "vpc_frontend"{
  description ="cidr block for front end"
  default = "10.0.1.0/24"
}

#variables for app layer
variable "vpc_applayer"{
  description ="cidr block for app layer"
  default = "10.0.2.0/24"
}

#variables for database
variable "vpc_database"{
  description ="cidr block for database"
  default = "10.0.3.0/24"
}



