resource "aws_vpc" "My_vpc" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "open-mrs"
  }
}

resource "aws_subnet" "subnet-1" {
  cidr_block        = "10.10.0.0/24"
  vpc_id            = "${aws_vpc.My_vpc.id}"
  availability_zone = "eu-west-3a"
  tags = {
    Name = "open-mrs"
  }
}
resource "aws_subnet" "subnet-2" {
  cidr_block        = "10.10.1.0/24"
  vpc_id            = "${aws_vpc.My_vpc.id}"
  availability_zone = "eu-west-3b"
  tags = {
    Name = "open-mrs"
  }
}

resource "aws_internet_gateway" "tf-igw" {
  vpc_id = "${aws_vpc.My_vpc.id}"
  tags = {
    Name = "open-mrs"
  }
}

resource "aws_route_table" "vpc-rt" {
  vpc_id = "${aws_vpc.My_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.tf-igw.id}"
  }
  tags = {
    Name = "open-mrs"
  }

}

resource "aws_security_group" "my_sg" {
  name        = "my_sg"
  description = "created from terraform"
  vpc_id      = "${aws_vpc.My_vpc.id}"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
    from_port   = "0"
    to_port     = "0"
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
    from_port   = "0"
    to_port     = "0"
  }
  tags = {
    Name = "open-mrs"
  }
}

resource "aws_route_table_association" "my_rt_association" {
  subnet_id      = "${aws_subnet.subnet-1.id}"
  route_table_id = "${aws_route_table.vpc-rt.id}"

}
resource "aws_route_table_association" "my_rt_association2" {
  subnet_id      = "${aws_subnet.subnet-2.id}"
  route_table_id = "${aws_route_table.vpc-rt.id}"

}

resource "aws_instance" "web1" {
  ami                         = "${var.ami-id}"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.my_sg.id}"]
  subnet_id                   = "${aws_subnet.subnet-1.id}"
  associate_public_ip_address = true
  key_name                    = "${var.awskeypair}"

  tags = {
    Name = "open-mrs1"
  }
  connection {
    type        = "ssh"
    user        = "${var.sshusername}"
    private_key = "${file(var.sshkeypath)}"
    host        = "${aws_instance.web1.public_ip}"
  }
    provisioner "remote-exec" {
        inline  = [
            "sudo apt-get update",
            "sudo apt-get install -f",
            "sudo apt-get upgrade -y",
            "sudo apt-get update",
			"sudo apt-get install openjdk-8-jdk -y",
            "sudo apt-get install apache2 -y"

        ]
    }

}

resource "aws_instance" "web2" {
  ami                         = "${var.ami-id}"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.my_sg.id}"]
  subnet_id                   = "${aws_subnet.subnet-2.id}"
  associate_public_ip_address = true
  key_name                    = "${var.awskeypair}"

  tags = {
    Name = "open-mrs"
  }
  connection {
    type        = "ssh"
    user        = "${var.sshusername}"
    private_key = "${file(var.sshkeypath)}"
    host        = "${aws_instance.web2.public_ip}"
  }
    provisioner "remote-exec" {
        inline  = [
          "sudo apt-get update",
			    "sudo apt-get install openjdk-8-jdk -y",
          "sudo apt-get install apache2 -y",
          "sudo apt-get install tomcat8 -y"

        ]
    }
}

