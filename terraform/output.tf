# output "vpc_id" {
#   value = values(aws_vpc.vpcs).*.id
# }

output "vpc_id" {
  value = {
    for vpc_name, vpc in aws_vpc.vpcs : vpc_name => vpc.id
  }
}

# output "vpc_id" {
#   value = {
#     for k, bd in mso_schema_template_bd.bd : k => bd.name
#   }
# }