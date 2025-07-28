################################################################################
# Buket
################################################################################

output "bucket_name" {
  value       = var.truefoundry_gcs_enabled ? module.truefoundry_gcs[0].name : ""
  description = "GCS bucket name"
}

output "bucket_url" {
  value       = var.truefoundry_gcs_enabled ? module.truefoundry_gcs[0].url : ""
  description = "GCS bucket URL"
}

################################################################################
# IAM serviceaccount
################################################################################

output "serviceaccount_email" {
  value       = module.service_accounts.email
  description = "Serviceaccount email"
}

output "serviceaccount_iam_email" {
  value       = module.service_accounts.iam_email
  description = "Serviceaccount IAM email"
}

output "serviceaccount_detail" {
  value       = jsonencode(module.service_accounts.service_account)
  description = "Serviceaccount details"
}

output "serviceaccount_members" {
  value       = module.service_account_iam_bindings.members
  description = "Serviceaccount members"
}

output "serviceaccount_roles" {
  value       = module.service_account_iam_bindings.roles
  description = "Serviceaccount roles"
}

output "serviceaccount_binding_service_accounts" {
  value       = module.service_account_iam_bindings.service_accounts
  description = "Serviceaccount bindings"
}

################################################################################
# Database
################################################################################

output "database_name" {
  value       = var.truefoundry_db_enable ? var.truefoundry_db_database_name : null
  description = "Database's name"
}

output "database_username" {
  value       = var.truefoundry_db_enable ? "postgres" : null
  description = "Database's username"
}

output "database_password" {
  value       = var.truefoundry_db_enable ? random_password.truefoundry_db_password[0].result : null
  sensitive   = true
  description = "Database's password"
}

output "instance_ip_address" {
  value       = var.truefoundry_db_enable ? module.postgresql-db[0].instance_ip_address : null
  description = "Database instance IP address"
}

output "instance_name" {
  value       = var.truefoundry_db_enable ? module.postgresql-db[0].instance_name : null
  description = "Database instance name"
}

output "instance_self_link" {
  value       = var.truefoundry_db_enable ? module.postgresql-db[0].instance_self_link : null
  description = "Self link of the database"
}

output "instance_server_ca_cert" {
  value       = var.truefoundry_db_enable ? module.postgresql-db[0].instance_server_ca_cert : null
  sensitive   = true
  description = "Self link of the database server ca cert"
}

output "instance_service_account_email_address" {
  value       = var.truefoundry_db_enable ? module.postgresql-db[0].instance_service_account_email_address : null
  description = "Service account email address"
}

output "instances" {
  value     = var.truefoundry_db_enable ? module.postgresql-db[0].instances : null
  sensitive = true
}

output "primary" {
  value     = var.truefoundry_db_enable ? module.postgresql-db[0].primary : null
  sensitive = true
}

output "private_ip_address" {
  value       = var.truefoundry_db_enable ? module.postgresql-db[0].private_ip_address : null
  description = "Private IP address of the database instance"
}
