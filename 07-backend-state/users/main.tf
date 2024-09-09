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
