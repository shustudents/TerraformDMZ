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
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDW5ZspNMKbjV239fF8OFvOcZGUEvV7VkcaHvKQxu9Be4OBtiRfqObDGkX7hcckXDQT/ygn/he/f/FdAcpg/3TlY9DrSizprZ73awdiEwFnKL6/JItNsB57e7h8+SOttUJkl8Z8Po7EyZKDyjKOqtsuOzECk0Gt1x36/Ix/Hds3Dx7uYjdgGJXlzfKH3XijsNPO1G1ZuGJjIhPgqeXyIr6+rhyPvrCajAeKBNC+LT+dRqKnVWiMsMTg7fNl21mK592Oom4RWClcpsPwH+TblvVrdABOPj5g8JIstgvXt5JsZugXxA7YiuO6nIambjcArPXkETpZHgpbCZENOsXPQl/tQb1R4E+md6940lKWqwhAE5cc2IdYRpC69rxeijSqxtcYh4rpS4f3u26dBtHTMM3NI0vq4XObBdPqSu4Lfmkt6k4pT6ywajiOkTYM5qOcGozE4S0VAG12MtxD4Mkm9dXiqzDALmKEA9E97aBKUB3Dtz9+cVFRY/uhoAX1sRxJZpN1pyicWLPzjgurQTyp4Zi7TnUA2jxvf/S2MZEwaJrXB9eLLAfSKdMxJVzGAlG0OsC3w0iJ5z+vJUgn0sdry62YLWN9oBSxjwUGXoTcO2Zg3THDsbQAwOgLiEb5/QlDAbejI2X3H9LVRLlYs+P35qOZCASr0tEpcm1Y9Tojg62/ew== root@Earth"}
