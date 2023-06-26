resource "random_string" "id" {
  length  = 6
  upper   = false
  lower   = true
  special = false

}

resource "google_storage_bucket" "cloud-function-bucket" {
  name     = format("%s-%s", "cloud-functions", random_string.id.result)
  location = var.location
}

resource "google_storage_bucket_object" "code-archive" {
  name   = format("%s.zip", var.name)
  bucket = google_storage_bucket.cloud-function-bucket.name
  source = var.path_to_code_archive
}

resource "google_pubsub_topic" "cloud-function-pubsub" {
  name = var.topic_name
}

resource "google_cloudfunctions_function" "function" {
  # provider = google-beta
  name                  = var.name
  runtime               = var.runtime
  region                = var.location
  source_archive_bucket = google_storage_bucket.cloud-function-bucket.name
  source_archive_object = google_storage_bucket_object.code-archive.name
  entry_point           = var.entry_point

  environment_variables = var.environment_variables

  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = google_pubsub_topic.cloud-function-pubsub.id

  }
  lifecycle {
    replace_triggered_by = [google_storage_bucket_object.code-archive]
  }
  depends_on = [google_project_service.service]

}