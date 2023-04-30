terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
      
    }
  }
}





module "gke" {
  source                     = "../../modules/gke"
  name                       = var.name
  location                   = var.location
  subnetwork                 = data.terraform_remote_state.vpc.outputs.subnets["subnet-dimploma"]
  network                    = data.terraform_remote_state.vpc.outputs.vpc_name
  master_ipv4_cidr_block     = var.master_ipv4_cidr_block
  cluster_ipv4_cidr_block    = var.cluster_ipv4_cidr_block
  services_ipv4_cidr_block   = var.services_ipv4_cidr_block
  master_authorized_networks = var.master_authorized_networks
  project_id                 = var.project_id
  region                     = var.region
}

