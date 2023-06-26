resource "google_service_account" "service_account" {
  account_id   = "artifact-registry-writer"
  display_name = "Artifact registry writer"
}


resource "google_service_account_key" "json_key" {
  service_account_id = google_service_account.service_account.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}

# data "google_iam_policy" "artifact-registry-writer" {
#   binding {
#     role = "roles/artifactregistry.writer"
# 
#     members = [
#       "serviceAccount:${google_service_account.service_account.email}",
#     ]
#   }
# }

resource "google_project_iam_member" "artifact-registry-writer" {
  project = var.project_id
  role = "roles/artifactregistry.writer"
  member = "serviceAccount:${google_service_account.service_account.email}"
    
}

resource "google_project_iam_member" "storage-admin" {
  project = var.project_id
  role = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.service_account.email}"
    
}


resource "google_secret_manager_secret" "sa_key" {
  secret_id = "artifact-registry-writer-sa-key"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "secret-version-sa-key" {
  secret = google_secret_manager_secret.sa_key.id
  secret_data = base64decode(google_service_account_key.json_key.private_key)
}


