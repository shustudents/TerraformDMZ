#variables file for dmz
variable "vpc_cidr" {
  description = "cidr block for vpc" 
}

#variables for front end
variable "vpc_frontend"{
  description ="cidr block for front end
}

#variables for app layer
variable "vpc_applayer"{
  description ="cidr block for app layer
}

#variables for database
variable "vpc_database"{
  description ="cidr block for database
}
