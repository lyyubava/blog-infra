terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }

  }
}

module "init" {
  source               = "../../modules/init"
  tf_state_bucket_name = var.tf_state_bucket_name
  location             = var.location
}



