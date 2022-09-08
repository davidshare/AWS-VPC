resource aws_subnet "dev-subnet_1"{
  vpc_id = aws_vpc.dev_vpc.id
  cidr_block = var.subnet_cidr
  availability_zone = "us-east-1a"
}