name   = "vpc-diploma"
region = "us-south1"
subnets = [
  {
    ip_cidr_range = "10.3.0.0/24"
    name          = "subnet-dimploma"
  }
]

firewall_rules = [
  {
    name          = "fw-db",
    source_ranges = ["0.0.0.0/0"],
    ports         = ["5432"],
    protocol      = "tcp", 
    direction     = "INGRESS"

  }

]
