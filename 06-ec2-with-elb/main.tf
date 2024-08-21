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