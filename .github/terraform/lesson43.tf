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
#  access_key = var.access_key
#  secret_key = var.secret_key
}



#module "sg"  {
#  source = "/home/cos/DOS07/.github/terraform/tf_module"
#  vpc_id = "vpc-0e71bf50c88b4e61e"
#}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
#  vpc_id      = var.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
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
    Name = "allow_tls"
  }
}


output "sg_id"  {
  value = aws_security_group.allow_tls.id
}


#module "lb"  {
#  source = "/home/cos/DOS07/.github/terraform/hw_module"
#  sgr_id = [module.sg.sg_id]
#}


#output "secgr_id"  {
#  value = module.sg.sg_id
#}
