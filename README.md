# terraform-google-truefoundry-control-plane
Truefoundry Google Cloud Control Plane Module

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 6.11 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 6.11 |
| <a name="provider_random"></a> [random](#provider\_random) | ~> 3.6 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_postgresql-db"></a> [postgresql-db](#module\_postgresql-db) | GoogleCloudPlatform/sql-db/google//modules/postgresql | 23.0.0 |
| <a name="module_service_account_iam_bindings"></a> [service\_account\_iam\_bindings](#module\_service\_account\_iam\_bindings) | terraform-google-modules/iam/google//modules/service_accounts_iam | 8.0.0 |
| <a name="module_service_accounts"></a> [service\_accounts](#module\_service\_accounts) | terraform-google-modules/service-accounts/google | 4.4.1 |
| <a name="module_truefoundry_gcs"></a> [truefoundry\_gcs](#module\_truefoundry\_gcs) | terraform-google-modules/cloud-storage/google//modules/simple_bucket | 8.0.1 |

## Resources

| Name | Type |
|------|------|
| [google_compute_global_address.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_service_networking_connection.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_connection) | resource |
| [random_password.truefoundry_db_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Truefoundry deployment unique name | `string` | n/a | yes |
| <a name="input_mlfoundry_k8s_namespace"></a> [mlfoundry\_k8s\_namespace](#input\_mlfoundry\_k8s\_namespace) | The k8s mlfoundry namespace | `string` | `"truefoundry"` | no |
| <a name="input_mlfoundry_k8s_service_account"></a> [mlfoundry\_k8s\_service\_account](#input\_mlfoundry\_k8s\_service\_account) | The k8s mlfoundry service account name | `string` | `"mlfoundry-server"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP Project | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | region | `string` | n/a | yes |
| <a name="input_svcfoundry_k8s_namespace"></a> [svcfoundry\_k8s\_namespace](#input\_svcfoundry\_k8s\_namespace) | The k8s svcfoundry namespace | `string` | `"truefoundry"` | no |
| <a name="input_svcfoundry_k8s_service_account"></a> [svcfoundry\_k8s\_service\_account](#input\_svcfoundry\_k8s\_service\_account) | The k8s svcfoundry service account name | `string` | `"servicefoundry-server"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_truefoundry_db_availability_type"></a> [truefoundry\_db\_availability\_type](#input\_truefoundry\_db\_availability\_type) | Postgres availability type for the master instance. Accepted values are [ZONAL, REGIONAL]. Chose REGIONAL for HA | `string` | `"REGIONAL"` | no |
| <a name="input_truefoundry_db_database_charset"></a> [truefoundry\_db\_database\_charset](#input\_truefoundry\_db\_database\_charset) | Charset for the default database | `string` | `"UTF8"` | no |
| <a name="input_truefoundry_db_database_collation"></a> [truefoundry\_db\_database\_collation](#input\_truefoundry\_db\_database\_collation) | Collation for the default database | `string` | `"en_US.UTF8"` | no |
| <a name="input_truefoundry_db_database_name"></a> [truefoundry\_db\_database\_name](#input\_truefoundry\_db\_database\_name) | Name of the database | `string` | `"ctl"` | no |
| <a name="input_truefoundry_db_deletion_protection"></a> [truefoundry\_db\_deletion\_protection](#input\_truefoundry\_db\_deletion\_protection) | Enable deletion protection | `bool` | `false` | no |
| <a name="input_truefoundry_db_disk_autoresize"></a> [truefoundry\_db\_disk\_autoresize](#input\_truefoundry\_db\_disk\_autoresize) | Automically increase storage size | `bool` | `true` | no |
| <a name="input_truefoundry_db_disk_autoresize_limit"></a> [truefoundry\_db\_disk\_autoresize\_limit](#input\_truefoundry\_db\_disk\_autoresize\_limit) | Automically increase storage size | `number` | `30` | no |
| <a name="input_truefoundry_db_disk_size"></a> [truefoundry\_db\_disk\_size](#input\_truefoundry\_db\_disk\_size) | Disk size of the master instance | `number` | `20` | no |
| <a name="input_truefoundry_db_disk_type"></a> [truefoundry\_db\_disk\_type](#input\_truefoundry\_db\_disk\_type) | Disk size of the master instance | `string` | `"PD_SSD"` | no |
| <a name="input_truefoundry_db_edition"></a> [truefoundry\_db\_edition](#input\_truefoundry\_db\_edition) | The edition of the instance, can be ENTERPRISE or ENTERPRISE\_PLUS | `string` | `null` | no |
| <a name="input_truefoundry_db_enable"></a> [truefoundry\_db\_enable](#input\_truefoundry\_db\_enable) | Enable CloudSQL database | `bool` | `true` | no |
| <a name="input_truefoundry_db_enable_override"></a> [truefoundry\_db\_enable\_override](#input\_truefoundry\_db\_enable\_override) | Enable override for truefoundry db name. You must pass truefoundry\_db\_override\_name | `bool` | `false` | no |
| <a name="input_truefoundry_db_network_cidr"></a> [truefoundry\_db\_network\_cidr](#input\_truefoundry\_db\_network\_cidr) | Network CIDR for the truefoundry postgres database. Minimum range is /24. This CIDR must be different from the main subnet where your cluster is gettin created. This subnet is created inside the GCP's network. | `string` | n/a | yes |
| <a name="input_truefoundry_db_override_name"></a> [truefoundry\_db\_override\_name](#input\_truefoundry\_db\_override\_name) | Override name for truefoundry db. truefoundry\_db\_enable\_override must be set true | `string` | `""` | no |
| <a name="input_truefoundry_db_postgres_version"></a> [truefoundry\_db\_postgres\_version](#input\_truefoundry\_db\_postgres\_version) | Postgres version of cloudSQL | `string` | `"POSTGRES_15"` | no |
| <a name="input_truefoundry_db_tier"></a> [truefoundry\_db\_tier](#input\_truefoundry\_db\_tier) | Instance class for SQL DB | `string` | `"db-custom-1-3840"` | no |
| <a name="input_truefoundry_db_zone"></a> [truefoundry\_db\_zone](#input\_truefoundry\_db\_zone) | Zone for SQL DB - This must match the region | `string` | n/a | yes |
| <a name="input_truefoundry_gcs_cors_origins"></a> [truefoundry\_gcs\_cors\_origins](#input\_truefoundry\_gcs\_cors\_origins) | Allowed CORS origin for GCS bucket | `list(string)` | <pre>[<br/>  "*"<br/>]</pre> | no |
| <a name="input_truefoundry_gcs_enable_override"></a> [truefoundry\_gcs\_enable\_override](#input\_truefoundry\_gcs\_enable\_override) | Enable override for GCS bucket name. You must pass truefoundry\_gcs\_override\_name | `bool` | `false` | no |
| <a name="input_truefoundry_gcs_enabled"></a> [truefoundry\_gcs\_enabled](#input\_truefoundry\_gcs\_enabled) | Enable creation of GCS bucket | `bool` | `false` | no |
| <a name="input_truefoundry_gcs_force_destroy"></a> [truefoundry\_gcs\_force\_destroy](#input\_truefoundry\_gcs\_force\_destroy) | Enable force destroy on GCS bucket | `bool` | `true` | no |
| <a name="input_truefoundry_gcs_override_name"></a> [truefoundry\_gcs\_override\_name](#input\_truefoundry\_gcs\_override\_name) | Override name for GCS bucket. truefoundry\_gcs\_enable\_override must be set true | `string` | `""` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the network VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | GCS bucket name |
| <a name="output_bucket_url"></a> [bucket\_url](#output\_bucket\_url) | GCS bucket URL |
| <a name="output_database_name"></a> [database\_name](#output\_database\_name) | Database's name |
| <a name="output_database_password"></a> [database\_password](#output\_database\_password) | Database's password |
| <a name="output_database_username"></a> [database\_username](#output\_database\_username) | Database's username |
| <a name="output_instance_ip_address"></a> [instance\_ip\_address](#output\_instance\_ip\_address) | Database instance IP address |
| <a name="output_instance_name"></a> [instance\_name](#output\_instance\_name) | Database instance name |
| <a name="output_instance_self_link"></a> [instance\_self\_link](#output\_instance\_self\_link) | Self link of the database |
| <a name="output_instance_server_ca_cert"></a> [instance\_server\_ca\_cert](#output\_instance\_server\_ca\_cert) | Self link of the database server ca cert |
| <a name="output_instance_service_account_email_address"></a> [instance\_service\_account\_email\_address](#output\_instance\_service\_account\_email\_address) | Service account email address |
| <a name="output_instances"></a> [instances](#output\_instances) | n/a |
| <a name="output_primary"></a> [primary](#output\_primary) | n/a |
| <a name="output_private_ip_address"></a> [private\_ip\_address](#output\_private\_ip\_address) | Private IP address of the database instance |
| <a name="output_serviceaccount_binding_service_accounts"></a> [serviceaccount\_binding\_service\_accounts](#output\_serviceaccount\_binding\_service\_accounts) | Serviceaccount bindings |
| <a name="output_serviceaccount_detail"></a> [serviceaccount\_detail](#output\_serviceaccount\_detail) | Serviceaccount details |
| <a name="output_serviceaccount_email"></a> [serviceaccount\_email](#output\_serviceaccount\_email) | Serviceaccount email |
| <a name="output_serviceaccount_iam_email"></a> [serviceaccount\_iam\_email](#output\_serviceaccount\_iam\_email) | Serviceaccount IAM email |
| <a name="output_serviceaccount_members"></a> [serviceaccount\_members](#output\_serviceaccount\_members) | Serviceaccount members |
| <a name="output_serviceaccount_roles"></a> [serviceaccount\_roles](#output\_serviceaccount\_roles) | Serviceaccount roles |
<!-- END_TF_DOCS -->