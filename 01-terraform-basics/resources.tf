provider "aws" {
    region = "eu-north-1"
}

# Plan - execute
resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "my-s3-bucket-omonuj-001"

}
resource "aws_s3_bucket_versioning" "versioning" {  
  bucket = aws_s3_bucket.my_s3_bucket.id  

    versioning_configuration {
        status = "Enabled"
    }
}


resource "aws_iam_user" "my_iam_user" {
  name = "devops_user_omonuj_001"
} 
