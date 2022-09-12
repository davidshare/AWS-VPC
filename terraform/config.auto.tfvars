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
  public_1 = {
    subnet_cidr             = "10.0.0.0/24"
    vpc                     = "main"
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = false
    tags = {
      Name = "public_1"
    }
  },
  public_2 = {
    subnet_cidr             = "10.0.1.0/24"
    vpc                     = "main"
    availability_zone       = "us-east-1b"
    map_public_ip_on_launch = false
    tags = {
      Name = "public_2"
    }
  },
  private_1 = {
    subnet_cidr             = "10.0.2.0/24"
    vpc                     = "main"
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = false
    tags = {
      Name = "private_1"
    }
  },
  private_2 = {
    subnet_cidr             = "10.0.3.0/24"
    vpc                     = "main"
    availability_zone       = "us-east-1b"
    map_public_ip_on_launch = false
    tags = {
      Name = "private_2"
    }
  },
}

internet_gateways = {
  main_igw = {
    name = "main"
    vpc  = "main"
    tags = {
      Name        = "main"
      Environment = "prod"
    }
  }
}

natgateway_public1_tags = {
  Name        = "public 1"
  Environment = "dev"
}

natgateway_public2_tags = {
  Name        = "public 2"
  Environment = "dev"
}

# route tables
route_tables = {
  private_1 = {
    vpc = "main"
    tags = {
      Name = "Private Subnet 1"
    }
  },
  private_2 = {
    vpc = "main"
    tags = {
      Name = "Private Subnet 2"
    }
  },
  public_1 = {
    vpc = "main"
    tags = {
      Name = "Public Subnet 1"
    }
  },
  public_2 = {
    vpc = "main"
    tags = {
      Name = "Public Subnet 2"
    }
  }
}

route_table_associations = [
  "private_1",
  "private_2",
  "public_1",
  "public_2",
]