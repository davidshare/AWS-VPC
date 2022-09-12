/* NAT */
variable "natgateway_public1_tags" {
}

variable "natgateway_public2_tags" {
}

resource "aws_nat_gateway" "nat_gw_public1" {
  allocation_id = aws_eip.nat_eip_public1.id
  subnet_id     = aws_subnet.subnets["public_1"].id
  depends_on    = [aws_internet_gateway.internet_gateways["main"]]

  tags = var.natgateway_public1_tags
}

resource "aws_nat_gateway" "nat_gw_public2" {
  allocation_id = aws_eip.nat_eip_public2.id
  subnet_id     = aws_subnet.subnets["public_2"].id
  depends_on    = [aws_internet_gateway.internet_gateways["main"]]

  tags = var.natgateway_public2_tags
}