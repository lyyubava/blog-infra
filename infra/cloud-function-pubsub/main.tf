terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"

    }
  }
}



module "cloud-function-pubsub" {
  source                = "../../modules/cloud-function-pubsub"
  location              = var.location
  name                  = var.name
  entry_point           = var.entry_point
  path_to_code_archive  = var.path_to_code_archive
  topic_name            = var.topic_name
  runtime               = var.runtime
  environment_variables = var.environment_variables
  project_id            = var.project_id
}

