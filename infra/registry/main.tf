terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"

    }
  }
}

module "registry" {
  source                     = "../../modules/registry"
  location                   = var.location
  repository_id              = var.repository_id
  project_id                 = var.project_id
}

