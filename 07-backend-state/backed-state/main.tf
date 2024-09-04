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


#######################################
# Create S3 Bucket to store users state
#######################################

resource "aws_s3_bucket" "enterprise_backend_state" {
  bucket = "dev-application-backend-state-omonuj-001"

  lifecycle{
    prevent_destroy = true
  }

  lifecycle_rule {
    enabled = true
  }

  versioning {