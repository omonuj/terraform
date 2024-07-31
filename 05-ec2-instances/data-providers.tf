
data "aws_subnet_ids" "default_subnets" {
  vpc_id = aws_default_vpc.default.id
}


data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami_ads" "aws_linux_2_latest_ids" {
    owners = ["amazon"]
}
