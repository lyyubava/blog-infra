name                     = "social-network-cluster"
location                 = "europe-central2"
master_ipv4_cidr_block   = "172.16.0.0/28"
cluster_ipv4_cidr_block  = "/17"
services_ipv4_cidr_block = "/22"
master_authorized_networks = { name = "all", cidr_block = "0.0.0.0/0"
}

