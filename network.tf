resource "google_compute_global_address" "default" {
  name          = local.truefoundry_db_unique_name
  address_type  = "INTERNAL"
  purpose       = "VPC_PEERING"
  network       = var.vpc_id
  prefix_length = local.database_prefix
  address       = local.database_address
}

resource "google_service_networking_connection" "default" {
  network                 = var.vpc_id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.default.name]
}