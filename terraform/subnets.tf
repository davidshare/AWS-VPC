variable "subnets" {
  type = map(any)
}

resource "aws_subnet" "subnet" {
  for_each = var.subnets

  vpc_id            = aws_vpc.vpcs[each.value.vpc].id
  cidr_block        = each.value.subnet_cidr
  availability_zone = each.value.availability_zone
}