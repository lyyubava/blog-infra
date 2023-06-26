terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
  }
}

module "vpc" {
  source                                    = "../../modules/vpc"
  name                                      = var.name
  subnets                                   = var.subnets
  region                                    = var.region
  address_for_service_networking_connection = var.address_for_service_networking_connection
  project_id                                = var.project_id
}



