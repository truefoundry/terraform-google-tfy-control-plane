locals {
  truefoundry_blob_storage_name = var.truefoundry_gcs_enable_override ? var.truefoundry_gcs_override_name : "${var.cluster_name}-truefoundry"
  truefoundry_db_unique_name    = var.truefoundry_db_enable_override ? var.truefoundry_db_override_name : "${var.cluster_name}-db"
  serviceaccount_name           = "${var.cluster_name}-sa"
  serviceaccount_roles = [
    "${var.project_id}=>roles/artifactregistry.admin",
    "${var.project_id}=>roles/secretmanager.admin",
    "${var.project_id}=>roles/iam.serviceAccountTokenCreator",
    "${var.project_id}=>roles/storage.admin"
  ]
  tags = merge({
    "terraform-module" = "tfy-control-plane"
    "terraform"        = "true"
    "cluster-name"     = var.cluster_name
    "truefoundry"      = "managed"
    },
    var.tags
  )
  database_address = split("/", var.truefoundry_db_network_cidr)[0]
  database_prefix  = tonumber(split("/", var.truefoundry_db_network_cidr)[1])
}