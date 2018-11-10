resource "aws_vpc" "dmz" {
#  cidr_block       = "10.0.0.0/16"
  cidr_block       = "${var.vpc_cidr}"

  tags {
    Name = "dmz"
  }
}
resource "aws_subnet" "frontend" {
  vpc_id      = "${aws_vpc.dmz.id}"
  cidr_block = "${var.vpc_frontend}"

  tags {
  Name = "Frontend"
  }
}
resource "aws_subnet" "applayer" {
  vpc_id      = "${aws_vpc.dmz.id}"
  cidr_block = "${var.vpc_applayer}"

  tags {
  Name = "AppLayer"
  }
}
resource "aws_subnet" "database" {
  vpc_id      = "${aws_vpc.dmz.id}"
  cidr_block = "${var.vpc_database}"

  tags {
  Name = "Database"
  }
 } 
  resource "aws_internet_gateway" "gw" {
    vpc_id = "${aws_vpc.dmz.id}"

  tags {
    Name = "VPC IGW"
  }
}
resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.dmz.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.gw.id}"
}
resource "aws_eip" "dmz_eip" {
  vpc      = true
  depends_on = ["aws_internet_gateway.gw"]
 
}
resource "aws_nat_gateway" "nat" {
    allocation_id = "${aws_eip.dmz_eip.id}"
    subnet_id = "${aws_subnet.frontend.id}"
    depends_on = ["aws_internet_gateway.gw"]
}
resource "aws_route_table" "privatert" {
  vpc_id = "${aws_vpc.dmz.id}"
  tags {
    Name = "Priv Subnet RT"
  }
}
resource "aws_route" "private_route" {
	route_table_id  = "${aws_route_table.privatert.id}"
	destination_cidr_block = "0.0.0.0/0"
	nat_gateway_id = "${aws_nat_gateway.nat.id}"
}
resource "aws_route_table_association" "frontend_assoc" {
  subnet_id = "${aws_subnet.frontend.id}"
  route_table_id = "${aws_vpc.dmz.main_route_table_id}"
}
resource "aws_route_table_association" "app_association" {
    subnet_id = "${aws_subnet.applayer.id}"
    route_table_id = "${aws_route_table.privatert.id}"
}
resource "aws_route_table_association" "database_association" {
    subnet_id = "${aws_subnet.database.id}"
    route_table_id = "${aws_route_table.privatert.id}"
}
resource "aws_lb" "load_balancer_frontend" {
  name               = "front-lb"
  internal           = false
  load_balancer_type = "network"
  subnets            = ["${aws_subnet.frontend.id}"]

#  enable_deletion_protection = true

  tags {
    Environment = "Environment DMZ"
  }
}
resource "aws_security_group" "publicsg" {
  name = "vpc_public_web"
  description = "Allow incoming HTTP connections & SSH access"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  vpc_id="${aws_vpc.dmz.id}"

  tags {
    Name = "Public and Frontend SG"
  }
}

resource "aws_security_group" "privatesg"{
  name = "sg_private_web"
  description = "Allow traffic from public subnet"

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["${var.vpc_frontend}"]
  }

  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["${var.vpc_frontend}"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.vpc_frontend}"]
  }

  vpc_id = "${aws_vpc.dmz.id}"

  tags {
    Name = "Private SG"
  }
}
