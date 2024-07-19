variable "users" {
   default = {
    ravs: {country: "Netherland", department: "Engineering"},
    tom: {country: "US", department: "Sales"},
    john: {country: "Nigeria", department: "Marketing"},
   }
}


provider "aws" {
    region = "eu-north-1"