variable "route_tables" {
  type = map(any)
}

variable "route_table_associations" {
  type = list
}

variable "internet_gateway_routes" {
  type = map(any)
}

variable "nat_gateway_routes" {
  type = map(any)
}

# Route tables
resource "aws_route_table" "route_tables" {
  for_each = var.route_tables

  vpc_id   = aws_vpc.vpcs[each.value.vpc].id
  tags     = each.value.tags
}

# Route table associations
resource "aws_route_table_association" "route_table_associations" {
  count = length(var.route_tables)

  subnet_id      = aws_subnet.subnets[var.route_table_associations[count.index]].id
  route_table_id = aws_route_table.route_tables[var.route_table_associations[count.index]].id
}


# Routes for Internet Gateway
resource "aws_route" "internet_gateway_routes" {
  for_each = var.internet_gateway_routes

  route_table_id         = aws_route_table.route_tables[each.value.route_table].id
  destination_cidr_block = each.value.cidr
  gateway_id             = aws_internet_gateway.internet_gateways[each.value.gateway].id
}

# Routes for NAT
resource "aws_route" "nat_gateway_routes" {
  for_each = var.nat_gateway_routes

  route_table_id         = aws_route_table.route_tables[each.value.route_table].id
  destination_cidr_block = each.value.cidr
  gateway_id             = aws_internet_gateway.internet_gateways[each.value.gateway].id
}