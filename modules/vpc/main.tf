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

resource "google_compute_firewall" "firewall" {
  network  = google_compute_network.vpc_network.name
  for_each = { for item in var.firewall_rules : item.name => item }
  name     = each.value.name

  allow {
    protocol = each.value.protocol
    ports    = each.value.ports
  }
  direction = each.value.direction
  source_ranges = each.value.source_ranges
  source_tags = [ each.value.source_tags ]
  target_tags = [ each.value.target_tags ]
}

