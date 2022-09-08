vpcs = {
  main_vpc = {
    cidr                 = "10.0.0.0/16"
    instance_tenancy     = "default"
    enable_dns_support   = true
    enable_dns_hostnames = false
    tags = {
      Name        = "main",
      Environment = "dev",
      Maintainer  = "David Essien"
    }
  }
}

subnets = {
  public_subnet1 = {
    subnet_cidr       = "10.0.10.0/24"
    vpc               = "main_vpc"
    availability_zone = "us-east-1a"
  }
}