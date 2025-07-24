terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.46"
    }
  }

  backend "s3" {}
}


provider "aws" {
  region = "eu-north-1"
}


resource "aws_iam_user" "my_iam_user" {
  name = "devops_user_omonuj_001_${terraform.workspace}"
}
