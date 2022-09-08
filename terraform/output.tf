output "vpc_id" {
  value = values(aws_vpc.vpcs).*.id
}