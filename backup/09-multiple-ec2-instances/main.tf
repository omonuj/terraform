provider "aws" {
  region  = "us-east-1"
  //version = "~> 2.46"
}

resource "aws_default_vpc" "default" {