terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
  }
}

module "vpc" {
  source         = "../../modules/vpc"
  name           = var.name
  subnets        = var.subnets
  region         = var.region
}
