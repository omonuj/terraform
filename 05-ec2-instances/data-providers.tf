
data "aws_subnet_ids" "default_subnets" {
  vpc_id = aws_default_vpc.default.id
}


data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]