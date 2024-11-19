################################################################################
# Generic
################################################################################

variable "cluster_name" {
  description = "Truefoundry deployment unique name"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "region" {
  description = "region"
  type        = string
}

variable "project_id" {
  description = "GCP Project"
  type        = string
}

variable "vpc_id" {
  description = "ID of the network VPC"
  type        = string
}
##################################################################################
## Database
##################################################################################

variable "truefoundry_db_enable" {
  type        = bool
  description = "Enable CloudSQL database"
  default     = true
}

variable "truefoundry_db_deletion_protection" {
  type        = bool
  description = "Enable deletion protection"
  default     = false
}

variable "truefoundry_db_postgres_version" {
  type        = string
  description = "Postgres version of cloudSQL"
  default     = "POSTGRES_15"
}

variable "truefoundry_db_network_cidr" {
  type        = string
  description = "Network CIDR for the truefoundry postgres database. Minimum range is /24. This CIDR must be different from the main subnet where your cluster is gettin created. This subnet is created inside the GCP's network."
}

variable "truefoundry_db_availability_type" {
  type        = string
  description = "Postgres availability type for the master instance. Accepted values are [ZONAL, REGIONAL]. Chose REGIONAL for HA"
  default     = "REGIONAL"
}

variable "truefoundry_db_database_charset" {
  type        = string
  description = "Charset for the default database"
  default     = "UTF8"
}

variable "truefoundry_db_database_collation" {
  type        = string
  description = "Collation for the default database"
  default     = "en_US.UTF8"
}

variable "truefoundry_db_database_name" {
  type        = string
  description = "Name of the database"
  default     = "ctl"
}

variable "truefoundry_db_disk_autoresize" {
  type        = bool
  description = "Automically increase storage size"
  default     = true
}

variable "truefoundry_db_disk_autoresize_limit" {
  type        = number
  description = "Automically increase storage size"
  default     = 30
}

variable "truefoundry_db_disk_size" {
  type        = number
  description = "Disk size of the master instance"
  default     = 20
}

variable "truefoundry_db_disk_type" {
  type        = string
  description = "Disk size of the master instance"
  default     = "PD_SSD"
}

variable "truefoundry_db_edition" {
  type        = string
  description = "The edition of the instance, can be ENTERPRISE or ENTERPRISE_PLUS"
  default     = null
}

variable "truefoundry_db_tier" {
  type        = string
  description = "Instance class for SQL DB"
  default     = "db-custom-1-3840"
}
variable "truefoundry_db_zone" {
  type        = string
  description = "Zone for SQL DB - This must match the region"
}

variable "truefoundry_db_enable_override" {
  description = "Enable override for truefoundry db name. You must pass truefoundry_db_override_name"
  type        = bool
  default     = false
}
variable "truefoundry_db_override_name" {
  description = "Override name for truefoundry db. truefoundry_db_enable_override must be set true"
  type        = string
  default     = ""
}

################################################################################
# mlfoundry
################################################################################

variable "mlfoundry_k8s_service_account" {
  description = "The k8s mlfoundry service account name"
  type        = string
  default     = "mlfoundry-server"
}

variable "mlfoundry_k8s_namespace" {
  description = "The k8s mlfoundry namespace"
  type        = string
  default     = "truefoundry"
}

################################################################################
# servicefoundry
################################################################################

variable "svcfoundry_k8s_service_account" {
  description = "The k8s svcfoundry service account name"
  type        = string
  default     = "servicefoundry-server"
}

variable "svcfoundry_k8s_namespace" {
  description = "The k8s svcfoundry namespace"
  type        = string
  default     = "truefoundry"
}

################################################################################
# MLfoundry bucket
##################################################################

variable "truefoundry_gcs_enabled" {
  description = "Enable creation of GCS bucket"
  type        = bool
  default     = false
}

variable "truefoundry_gcs_enable_override" {
  description = "Enable override for GCS bucket name. You must pass truefoundry_gcs_override_name"
  type        = bool
  default     = false
}
variable "truefoundry_gcs_override_name" {
  description = "Override name for GCS bucket. truefoundry_gcs_enable_override must be set true"
  type        = string
  default     = ""

  validation {
    condition     = length(var.truefoundry_gcs_override_name) <= 63
    error_message = "Error: Bucket name is too long."
  }
}

variable "truefoundry_gcs_cors_origins" {
  description = "Allowed CORS origin for GCS bucket"
  type        = list(string)
  default     = ["*"]
}
variable "truefoundry_gcs_force_destroy" {
  description = "Enable force destroy on GCS bucket"
  type        = bool
  default     = true
}