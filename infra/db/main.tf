terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"

    }
  }
}



module "db" {
  source           = "../../modules/db"
  tier             = var.tier
  name             = var.name
  vpc_id           = data.terraform_remote_state.vpc.outputs.vpc_id
  vpc_name         = data.terraform_remote_state.vpc.outputs.vpc_name
  database_version = var.database_version
  region           = var.region
}

