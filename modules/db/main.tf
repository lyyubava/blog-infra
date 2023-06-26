resource "random_string" "root-password" {
  length  = 6
  upper   = false
  lower   = true
  special = false
}

resource "google_sql_database_instance" "database" {
  name             = var.name
  database_version = var.database_version
  region           = var.region

  settings {
    tier = var.tier
    ip_configuration {
      ipv4_enabled    = false
      private_network = var.vpc_id
    }
  }
  root_password = random_string.root-password.result
}