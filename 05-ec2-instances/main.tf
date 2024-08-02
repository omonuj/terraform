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


