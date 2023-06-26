data "terraform_remote_state" "vpc" {
  backend = "gcs"
  config = {
    bucket = "social-network-state-aefoh7fu"
    prefix = "vpc"
  }
}