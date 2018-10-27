resource "aws_vpc" "dmz" {
  cidr_block       = "10.0.0.0/16"

  tags {
    Name = "dmz"
  }
}
resource "aws_subnet" "frontend" {
  vpc_id      = "${aws_vpc.dmz.id}"
  cidr_block = "10.0.1.0/24"

  tags {
  Name = "Frontend"
  }
}
resource "aws_subnet" "applayer" {
  vpc_id      = "${aws_vpc.dmz.id}"
  cidr_block = "10.0.2.0/24"

  tags {
  Name = "AppLayer"
  }
}
resource "aws_subnet" "database" {
  vpc_id      = "${aws_vpc.dmz.id}"
  cidr_block = "10.0.3.0/24"

  tags {
  Name = "Database"
  }
}

