variable "users" {
   default = {
    ravs: {country: "Netherland", department: "Engineering"},
    tom: {country: "US", department: "Sales"},
    john: {country: "Nigeria", department: "Marketing"},
   }
}


provider "aws" {
    region = "eu-north-1"
}

resource "aws_iam_user" "my_iam_user" {
    for_each = var.users
    name     = each.key
    tags = {
        Country = each.value.country
        Department = each.value.department
    }  
} 
 