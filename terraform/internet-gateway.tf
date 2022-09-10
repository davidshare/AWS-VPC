variable "internet_gateways" {
  type = map(any)
}

resource "aws_internet_gateway" "internet-gw" {
  for_each = var.internet_gateways

  vpc_id = aws_vpc.vpcs[each.value.vpc].id
  tags   = each.value.tags
}