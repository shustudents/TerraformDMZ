data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical

  tags {
    Name = "ami ec2 instance type"
  }
}

data "template_file" "ec2_template" {
  template = "${file("./userdata.tpl")}"
}

resource "aws_instance" "front_ec2" {
    ami = "${data.aws_ami.ubuntu.id}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.frontend.id}"
    security_groups = [
        "${aws_security_group.publicsg.id}",
    ]
    tags {
        Name = "Frontend EC2"
    }
    user_data = "${data.template_file.ec2_template.rendered}"
}
resource "aws_instance" "app_ec2" {
    ami = "${data.aws_ami.ubuntu.id}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.applayer.id}"
    security_groups = [
        "${aws_security_group.privatesg.id}"
    ]
    tags {
        Name = "App EC2"
    }
}
resource "aws_instance" "backend_ec2" {
    ami = "${data.aws_ami.ubuntu.id}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.database.id}"
    security_groups = [
        "${aws_security_group.privatesg.id}"
    ]
    tags {
        Name = "Back EC2"
    }
}
