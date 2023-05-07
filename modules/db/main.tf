resource "google_sql_database_instance" "database" {
    name             =  var.name
    database_version = var.database_version
    region           = var.region

    settings {
        tier = var.tier
        ip_configuration {
            ipv4_enabled = false
            private_network = var.vpc_id
        }
     }
    depends_on = [google_service_networking_connection.connection]
}
