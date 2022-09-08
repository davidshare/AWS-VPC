variable "vpcs" {
  type = map(any)
}

resource "aws_vpc" "vpcs" {
  for_each = var.vpcs

  cidr_block           = each.value.cidr
  instance_tenancy     = each.value.instance_tenancy
  enable_dns_hostnames = each.value.enable_dns_hostnames
  enable_dns_support   = each.value.enable_dns_support
  tags                 = each.value.tags
}