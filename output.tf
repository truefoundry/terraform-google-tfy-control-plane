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
  value       = module.service_accounts.service_account
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


output "database_password" {
  value       = var.truefoundry_db_enable ? random_password.truefoundry_db_password.result : ""
  sensitive   = true
  description = "Database's password"
}

output "instance_ip_address" {
  value       = var.truefoundry_db_enable ? module.postgresql-db.instance_ip_address : ""
  description = "Database instance IP address"
}

output "instance_name" {
  value       = var.truefoundry_db_enable ? module.postgresql-db.instance_name : ""
  description = "Database instance name"
}

output "instance_self_link" {
  value       = var.truefoundry_db_enable ? module.postgresql-db.instance_self_link : ""
  description = "Self link of the database"
}

output "instance_server_ca_cert" {
  value       = var.truefoundry_db_enable ? module.postgresql-db.instance_server_ca_cert : ""
  sensitive   = true
  description = "Self link of the database server ca cert"
}

output "instance_service_account_email_address" {
  value       = var.truefoundry_db_enable ? module.postgresql-db.instance_service_account_email_address : ""
  description = "Service account email address"
}

output "instances" {
  value     = var.truefoundry_db_enable ? module.postgresql-db.instances : ""
  sensitive = true
}

output "primary" {
  value     = var.truefoundry_db_enable ? module.postgresql-db.primary : ""
  sensitive = true
}

output "private_ip_address" {
  value       = var.truefoundry_db_enable ? module.postgresql-db.private_ip_address : ""
  description = "Private IP address of the database instance"
}