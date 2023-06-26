resource "google_project_service" "service" {
  service = "secretmanager.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_secret_manager_secret" "db_host" {
  provider  = google-beta
  secret_id = "db_host"
  replication {
    automatic = true
  }
  # project = google_project.project.number
  depends_on = [
    google_project_service.service
  ]
}

resource "google_secret_manager_secret_version" "secret-version-db-host" {
  provider    = google-beta
  secret      = google_secret_manager_secret.db_host.id
  secret_data = google_sql_database_instance.database.private_ip_address
}


resource "google_secret_manager_secret" "root_password" {
  provider  = google-beta
  secret_id = "root_password"
  replication {
    automatic = true
  }
  # project = google_project.project.number
  depends_on = [
    google_project_service.service
  ]
}

resource "google_secret_manager_secret_version" "secret-version-root-password" {
  provider    = google-beta
  secret      = google_secret_manager_secret.root_password.id
  secret_data = random_string.root-password.result
}







