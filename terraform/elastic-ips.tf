/* Elastic IP for NAT */
resource "aws_eip" "nat_eip_public1" {
  vpc        = true
  depends_on = [aws_internet_gateway.internet_gateways["main"]]
}

resource "aws_eip" "nat_eip_public2" {
  vpc        = true
  depends_on = [aws_internet_gateway.internet_gateways["main"]]
}