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

