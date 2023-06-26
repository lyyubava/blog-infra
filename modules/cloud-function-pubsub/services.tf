locals {
  api_to_enable = [
    "cloudbuild.googleapis.com",
    "cloudfunctions.googleapis.com",
    "logging.googleapis.com",
    "pubsub.googleapis.com"
  ]
}

resource "google_project_service" "service" {
  for_each = toset(local.api_to_enable)
  service  = each.key

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}
