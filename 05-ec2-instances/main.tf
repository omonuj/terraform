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


resource "aws_default_vpc" "default" {

}



// HTTP Server -> SG
//SG -> 80 TCP, 22  TCP, CIDR ["0.0.0.0/0"] 

resource "aws_security_group" "http_server_sg" {
  name   = "http_server_sg"
  vpc_id = aws_default_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "http_server_sg"
  }
}


#EC2 Intance -> Amazon Linux 2

resource "aws_instance" "http_server" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t3.micro"
  key_name      = "default-ec2"

  vpc_security_group_ids = [aws_security_group.http_server_sg.id]

  subnet_id = tolist(data.aws_subnet_ids.default_subnets.ids)[0]

  tags = {
    Name = "http_server"
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.aws_key_pair)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",
      "echo Welcome to Omonuj - Virtual Server is at ${self.public_dns} | sudo tee /var/www/html/index.html"
    ]
  }
}