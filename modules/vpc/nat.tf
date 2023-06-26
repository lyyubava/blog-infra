resource "google_compute_router" "router" {
  name    = "${var.name}-router"
  network = google_compute_network.vpc_network.name
  region  = var.region
}


module "cloud-nat" {
  source                             = "terraform-google-modules/cloud-nat/google"
  version                            = "~> 2.0"
  project_id                         = var.project_id
  router                             = google_compute_router.router.name
  name                               = "${var.name}-nat"
  region                             = var.region
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
