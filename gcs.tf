module "truefoundry_gcs" {
  count                    = var.truefoundry_gcs_enabled ? 1 : 0
  source                   = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version                  = "9.1.0"
  project_id               = var.project_id
  name                     = local.truefoundry_blob_storage_name
  location                 = var.region
  force_destroy            = var.truefoundry_gcs_force_destroy
  labels                   = local.tags
  public_access_prevention = "enforced"
  cors = [{
    origin          = var.truefoundry_gcs_cors_origins
    method          = ["GET", "POST", "PUT"]
    max_age_seconds = 3000
  }]
  lifecycle_rules = [
    {
      action = {
        type = "AbortIncompleteMultipartUpload"
      }
      condition = {
        age = "7"
      }
    }
  ]
}
