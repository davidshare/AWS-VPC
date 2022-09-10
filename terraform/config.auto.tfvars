vpcs = {
  main = {
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
    subnet_cidr       = "10.0.0.0/24"
    vpc               = "main"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = false
    tags = {
      Name = "public_subnet1"
    }
  },
  public_subnet2 = {
    subnet_cidr       = "10.0.1.0/24"
    vpc               = "main"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = false
    tags = {
      Name = "public_subnet2"
    }
  },
  private_subnet1 = {
    subnet_cidr       = "10.0.2.0/24"
    vpc               = "main"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = false
    tags = {
      Name = "private_subnet1"
    }
  },
  private_subnet2 = {
    subnet_cidr       = "10.0.3.0/24"
    vpc               = "main"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = false
    tags = {
      Name = "private_subnet2"
    }
  },
}

internet_gateways = {
  main_igw = {
    name = "main"
    vpc  = "main"
    tags = {
      Name = "main"
      Environment = "prod"
    }
  }
}