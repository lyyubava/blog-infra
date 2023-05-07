resource "google_compute_global_address" "address" {
  name          = "${var.vpc_name}-private-ip"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = var.vpc_id
}

resource "google_service_networking_connection" "connection" {
  network                 = var.vpc_id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.address.name]
}

resource "google_compute_network_peering_routes_config" "peering" {
  peering              = google_service_networking_connection.connection.peering
  network              = var.vpc_name
  import_custom_routes = true
  export_custom_routes = true
}

