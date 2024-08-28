provider "aws" {
    region = "us-east-1"
    //version = "~> 2.46"
}

//S3 bucket
resource "aws_s3_bucket" "enterprise_backend_state" {
    bucket = "dev-applications-backend-state-in28minutes-abc"

    lifecycle {
        prevent_destroy = true
    }
