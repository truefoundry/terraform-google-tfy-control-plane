resource "google_compute_global_address" "default" {
  count         = var.truefoundry_db_enable ? 1 : 0
  name          = local.truefoundry_db_unique_name
  project       = var.project_id
  address_type  = "INTERNAL"
  purpose       = "VPC_PEERING"
  network       = var.vpc_id
  prefix_length = local.database_prefix
  address       = local.database_address
}

resource "google_service_networking_connection" "default" {
  count                   = var.truefoundry_db_enable ? 1 : 0
  network                 = var.vpc_id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.default[0].name]
}
