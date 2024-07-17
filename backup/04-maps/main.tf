variable "users" {
  default = {
    ravs : { country : "Netherlands", department : "ABC" },
    tom : { country : "US", department : "DEF" },
    jane : { country : "India", department : "XYZ" }
  }
}

provider "aws" {
  region  = "us-east-1"
  //version = "~> 2.46" (No longer necessary)