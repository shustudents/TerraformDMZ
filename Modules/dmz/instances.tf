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
  template = "${file("${var.ec2_template}")}"
}

resource "aws_instance" "front_ec2" {
    ami = "${data.aws_ami.ubuntu.id}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.frontend.id}"
    associate_public_ip_address = true
    key_name      = "${aws_key_pair.generated_key.key_name}"
    security_groups = [
        "${aws_security_group.publicsg.id}",
        "${aws_security_group.mgmt_sg.id}",
#	"${aws_security_group.mgmt_sg.id}",
    ]
    tags {
        Name = "Frontend EC2"
    }
    user_data = "${var.ec2_template}"
# user_data = "${data.template_file.ec2_template.rendered}"
}
resource "aws_instance" "app_ec2" {
    ami = "${data.aws_ami.ubuntu.id}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.applayer.id}"
    key_name      = "${aws_key_pair.generated_key.key_name}"
    security_groups = [
        "${aws_security_group.mgmt_sg.id}"
    ]
    tags {
        Name = "App EC2"
    }
}
resource "aws_instance" "backend_ec2" {
    ami = "${data.aws_ami.ubuntu.id}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.database.id}"
    key_name      = "${aws_key_pair.generated_key.key_name}"
    security_groups = [
        "${aws_security_group.mgmt_sg.id}",
    ]
    tags {
        Name = "Back EC2"
    }
}
resource "aws_instance" "ansible_bastion" {
   ami = "${data.aws_ami.ubuntu.id}"
   instance_type = "t2.micro"
   subnet_id = "${aws_subnet.management.id}"
   associate_public_ip_address = true
   key_name      = "${aws_key_pair.generated_key.key_name}"
   security_groups = [
    "${aws_security_group.bastionsg.id}",
   ]
   tags {
       Name = "mgmt EC2"
   }
   user_data = "${var.bastion_template}"
}
