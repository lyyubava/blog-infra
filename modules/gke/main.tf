resource "google_container_cluster" "cluster_autopilot" {
  name             = var.name
  location         = var.location
  enable_autopilot = true
  subnetwork       = var.subnetwork
  network          = var.network
  private_cluster_config {
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
    enable_private_nodes    = true
    enable_private_endpoint = false
  }
  ip_allocation_policy {
    cluster_ipv4_cidr_block  = var.cluster_ipv4_cidr_block
    services_ipv4_cidr_block = var.services_ipv4_cidr_block
  }
  master_authorized_networks_config {

    cidr_blocks {

      display_name = var.master_authorized_networks.name
      cidr_block   = var.master_authorized_networks.cidr_block
    }
  }
  depends_on = [google_project_service.service]
}


resource "google_project_service" "service" {
  service = "container.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}
