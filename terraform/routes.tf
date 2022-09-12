variable "route_tables" {
  type = map(any)
}

variable "route_table_associations" {
  type = list
}

resource "aws_route_table" "route_tables" {
  for_each = var.route_tables

  vpc_id   = aws_vpc.vpcs[each.value.vpc].id
  tags     = each.value.tags
}

resource "aws_route_table_association" "route_table_associations" {
  count = length(var.route_tables)

  subnet_id      = aws_subnet.subnets[var.route_table_associations[count.index]].id
  route_table_id = aws_route_table.route_tables[var.route_table_associations[count.index]].id
}
