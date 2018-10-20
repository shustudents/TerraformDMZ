resource "aws_vpc" "dmz" {
  cidr_block       = "10.0.0.0/16"

  tags {
    Name = "dmz"
  }
}
