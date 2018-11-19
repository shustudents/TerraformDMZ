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
variable "vpc_management"{
  description ="cidr block for database"
  default = "10.0.4.0/24"
}
variable "ec2_template"{
  description = "var for app file"
  default = "./userdata.tpl"
}
variable "bastion_template"{
  default = "./ansible.tpl"
}

variable "key_name" {
  default   = "ssh-key"
}


variable "my_ssh" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCXYelPJAIuN2oiyqgSpYag7H7W4j/wg1HQDWbC52U0qJCW4Gg4yR/bPIwzIWWQm0FUqYfHmhaNCQeQ2lQ8w9rDhxdRItt5EHG63tSJ4Yr1C6UH+HPtTxhZczuIuJ+aq8G5o3SlTNxSH9qdUNslR+gEN9pOkJpgUbd8lwTZ/DRrhlH+RLMO8eTtO1eC4X6GOakwA3AxJ2WderGLvZQ9NDEkL7KF82qHb9M7qn13x0GkgxPwHPESSt3Od6jYhfO080XPXLBY8HLryDBRGl65qCHvU9c+R7UcFasaCsR23IClGxbb5M5tVnM5nB/HrspdM4Dy0g59npy1202HJNgXK8J eric@Earth"
}
