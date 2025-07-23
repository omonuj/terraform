provider "aws" {
    region = "eu-north-1"
}

resource "aws_iam_user" "my_iam_user" {
  name = "devops_user_omonuj_001"
} 
