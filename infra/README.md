<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.tf_iam_member](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/project_iam_member) | resource |
| [google_project_service.project](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/project_service) | resource |
| [google_service_account.tf_service_account](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/service_account) | resource |
| [google_storage_bucket.tf_state](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/storage_bucket) | resource |
| [random_id.bucket_prefix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project ID of the GCP project where resources will be deployed | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->