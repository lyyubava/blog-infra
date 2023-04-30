resource "google_compute_network" "vpc_network" {
  name                    = var.name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  network       = google_compute_network.vpc_network.id
  for_each      = { for item in var.subnets : item.name => item }
  ip_cidr_range = each.value.ip_cidr_range
  name          = each.value.name
  region        = var.region
}


