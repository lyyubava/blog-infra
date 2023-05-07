resource "google_compute_router" "router" {
  name    = var.name
  network = var.network
  region  = var.region
}


module "cloud-nat" {
  source                             = "terraform-google-modules/cloud-nat/google"
  version                            = "~> 2.0"
  project_id                         = var.project_id
  router                             = google_compute_router.router.name
  name                               = var.name
  region                             = var.region
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
