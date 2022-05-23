terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}


resource "aws_security_group" "terraformlesson2_sg" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"

  ingress {
    description      = "ssh from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}



resource "aws_instance" "ec2instance_server" {
  ami           = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.terraformlesson2_sg.id]

  tags = {
    Name = "ec2instance_terraformlesson2"
  }
}


resource "aws_lb_target_group" "lb_terraformlesson2" {
  name     = "tf-lesson2-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}


resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}





output "instance_id"  {
  value = aws_instance.ec2instance_server.id
}
