terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.46"
    }
  }
}


provider "aws" {
  region = "eu-north-1"
}


resource "aws_default_vpc" "default" {

}


###########################################
# security group
###########################################

// HTTP Server -> SG
//SG -> 80 TCP, 22  TCP, CIDR ["0.0.0.0/0"] 

resource "aws_security_group" "elb_sg" {
  name   = "elb_sg"
  vpc_id = aws_default_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


}


############################################
# Load Balancer Resource
############################################

resource "aws_elb" "elb" {
  name = "elb"
  subnets = data.aws_subnet_ids.default_subnets.ids
  security_groups = [aws_security_group.elb_sg.id]
  instances = values(aws_instance.http_servers).*.id


  listener {
    instance_port     = 80