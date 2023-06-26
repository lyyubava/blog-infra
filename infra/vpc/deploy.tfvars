name   = "social-network-vpc"
region = "europe-central2"
subnets = [
  {
    ip_cidr_range = "10.3.0.0/16"
    name          = "social-network-subnet"
  }
]
address_for_service_networking_connection = "10.2.0.0"
project_id                                = "corded-key-385010"