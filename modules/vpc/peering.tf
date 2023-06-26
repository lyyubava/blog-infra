resource "google_compute_global_address" "address" {
  name          = "${var.name}-private-ip"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  address       = var.address_for_service_networking_connection
  prefix_length = 16
  network       = google_compute_network.vpc_network.id
}

resource "google_service_networking_connection" "connection" {
  network                 = google_compute_network.vpc_network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.address.name]
  depends_on              = [google_project_service.servicenetworking]
  timeouts {

  }
}

resource "google_compute_network_peering_routes_config" "peering" {
  peering              = google_service_networking_connection.connection.peering
  network              = google_compute_network.vpc_network.name
  import_custom_routes = true
  export_custom_routes = true
}

