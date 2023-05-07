
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