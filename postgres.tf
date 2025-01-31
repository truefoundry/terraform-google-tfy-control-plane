resource "random_password" "truefoundry_db_password" {
  count            = var.truefoundry_db_enable ? 1 : 0
  length           = 42
  special          = true
  override_special = "-_=+"
}

module "postgresql-db" {
  source  = "GoogleCloudPlatform/sql-db/google//modules/postgresql"
  version = "23.0.0"

  count            = var.truefoundry_db_enable ? 1 : 0
  name             = local.truefoundry_db_unique_name
  database_version = var.truefoundry_db_postgres_version
  project_id       = var.project_id

  activation_policy = "ALWAYS"
  availability_type = var.truefoundry_db_availability_type

  backup_configuration = var.truefoundry_db_enable ? {
    enabled                        = true
    start_time                     = "20:55"
    location                       = null
    point_in_time_recovery_enabled = true
    transaction_log_retention_days = "7"
    retained_backups               = 14
    retention_unit                 = "COUNT"
  } : null

  db_charset            = var.truefoundry_db_database_charset
  db_collation          = var.truefoundry_db_database_collation
  db_name               = var.truefoundry_db_database_name
  deletion_protection   = var.truefoundry_db_deletion_protection
  disk_autoresize       = var.truefoundry_db_disk_autoresize
  disk_autoresize_limit = var.truefoundry_db_disk_autoresize_limit
  disk_size             = var.truefoundry_db_disk_size
  disk_type             = var.truefoundry_db_disk_type
  edition               = var.truefoundry_db_edition

  ip_configuration = var.truefoundry_db_enable ? {
    ipv4_enabled       = false
    private_network    = var.vpc_id
    require_ssl        = false
    allocated_ip_range = null
    authorized_networks = [
      {
        name  = "sample-gcp-health-checkers-range"
        value = "130.211.0.0/28"
      }
    ]
  } : null

  region               = var.region
  root_password        = var.truefoundry_db_enable ? random_password.truefoundry_db_password[0].result : null
  zone                 = var.truefoundry_db_zone
  tier                 = var.truefoundry_db_tier
  user_labels          = local.tags
  random_instance_name = true

  depends_on = [google_service_networking_connection.default]
}
