resource "google_artifact_registry_repository" "repository" {
  location      = var.location
  repository_id = var.repository_id
  format        = "DOCKER"

  depends_on = [google_project_service.service]
}

resource "google_project_service" "service" {
  service = "artifactregistry.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}