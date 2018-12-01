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
variable "vpc_access"{
  description = "cidr for accessing cloud"
  default = "24.2.234.45/32"
}
variable "bastion_template"{
  default = "./ansible.tpl"
}

variable "key_name" {
  default   = "ssh-key"
}


variable "my_ssh" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDNlBHKyxUOiKlnDCScbnJy1PqfMwH7IND4lDA3dM7nWe/20kNZYrerNN8kRXMJLS/bsQx3dgowsFVvPpd1gsoSSKOZK7JNzGhZOx9Hd920uYFau3tHstrpE5vai+MdRdA1wBHDwVt2dPYbbZaddXBsgmlNAaL0Fe10YDfAEmnNe9RFdgQ/nMcJBoeCwajlP3xAlNzcSJUUBWA0vAwPEgp+PtFOy+fOqERcBwb5aos6hUbPwIlDtvf9xdG7pT2SQNAyQdKXzJywE98V8wiCJaD5W/oIFfr//Q8fS27C0szMLxUr7j7UV7eewNFfuuSVjgsgZ8ftz7fMoXXNZMygU7Vu0dT4J4mFVzJYXUuUEFTtFphKIo37O866342SWAPR3zUqi2iuP1cSJp8WPbBD+7ZwSVNexsRMaAKxDbH/ThogJ5qSfde+PcDEwRCw4WsscZBm7PrBJtRm8W7VDMikDJ+aDDD/a042zltmo0uw3ZwZIyHWWL08u4MMoaLrvD0Eum4DP4GpiPByM16lRl2/zGNhIB+RdyAfWxFyk3Vm7mPhdpKB8P/Tf5OdQMZ+PxRSa3Ow3Bg2XrxTtVDohRC6w1iwmRbeleICFMtlVnljKM6+NEfhPPDgq0XSqseu1n3RwpIbhuBfy3K0oxjSQs8dLYpwvZNc78cNKmLzRzn5SuLjtQ== eric@Earth"
}
