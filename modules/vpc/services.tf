resource "google_project_service" "servicenetworking" {
  # project = google_project.project.project_id
  service = "servicenetworking.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}
