resource "google_sql_database_instance" "lottery_results_database" {
  database_version = "MYSQL_8_0"
  name             = "lottery-results-database"
  project          = "cellular-codex-352520"
  region           = "southamerica-east1"

  settings {
    activation_policy = "ALWAYS"
    availability_type = "REGIONAL"

    backup_configuration {
      backup_retention_settings {
        retained_backups = 7
        retention_unit   = "COUNT"
      }

      binary_log_enabled             = true
      enabled                        = true
      location                       = "us"
      start_time                     = "02:00"
      transaction_log_retention_days = 7
    }

    disk_autoresize       = true
    disk_autoresize_limit = 0
    disk_size             = 100
    disk_type             = "PD_SSD"

    ip_configuration {
      authorized_networks {
        name  = "default-network"
        value = "0.0.0.0/0"
      }

      ipv4_enabled    = true
      private_network = "projects/cellular-codex-352520/global/networks/default"
    }

    location_preference {
      zone = "southamerica-east1-c"
    }

    pricing_plan = "PER_USE"
    tier         = "db-f1-micro"
  }
}
# terraform import google_sql_database_instance.lottery_results_database projects/cellular-codex-352520/instances/lottery-results-database
