module "service_accounts" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "4.5.0"
  project_id    = var.project_id
  names         = [local.serviceaccount_name]
  descriptions  = ["Truefoundry serviceaccount for truefoundry control-plane components"]
  display_name  = "Terraform-managed truefoundry control-plane service account"
  generate_keys = false
  project_roles = local.serviceaccount_roles
}

# // binding the serviceaccount to k8s serviceaccount
module "service_account_iam_bindings" {
  source           = "terraform-google-modules/iam/google//modules/service_accounts_iam"
  version          = "8.0.0"
  service_accounts = module.service_accounts.service_accounts[*].email
  project          = var.project_id
  mode             = "additive"
  bindings = {
    "roles/iam.workloadIdentityUser" = [
      "serviceAccount:${var.project_id}.svc.id.goog[${var.svcfoundry_k8s_namespace}/${var.svcfoundry_k8s_service_account}]",
      "serviceAccount:${var.project_id}.svc.id.goog[${var.mlfoundry_k8s_namespace}/${var.mlfoundry_k8s_service_account}]",
    ]
  }
}
