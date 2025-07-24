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
    enabled = true
  }


  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

}


######################################
# Locking state with DynamoDB
######################################

resource "aws_dynamodb_table" "enterprise_backend_lock" {
  name         = "dev_application_backend"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

} 