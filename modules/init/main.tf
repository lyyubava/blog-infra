resource "google_storage_bucket" "tf-state" {
  name                        = var.tf_state_bucket_name
  location                    = var.location
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
}

output "terraform-state-bucket-name" {
  value = google_storage_bucket.tf-state.id
}

