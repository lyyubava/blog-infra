resource "google_service_account" "service_account" {
  account_id   = "pubsub-publisher"
  display_name = "Pub/Sub Publisher"
}

resource "google_service_account_key" "json_key" {
  service_account_id = google_service_account.service_account.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}

resource "google_project_iam_member" "pubsub-publisher" {
  project = var.project_id
  role = "roles/pubsub.publisher"
  member = "serviceAccount:${google_service_account.service_account.email}"
    
}

resource "google_secret_manager_secret" "sa_key" {
  secret_id = "pubsub-publisher-sa-key"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "secret-version-sa-key" {
  secret = google_secret_manager_secret.sa_key.id
  secret_data = base64decode(google_service_account_key.json_key.private_key)
}


