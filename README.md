# terraform-aws-eks-irsa

Creates an IAM role that can be assumed by a Kubernetes service account.

The cluster OIDC provider value can be found with the command:

```sh
aws eks describe-cluster \
    --name "${CLUSTER_NAME}" \
    --query "cluster.identity.oidc.issuer" \
    --output text | sed -e "s/^https:\\/\\///"
```

[//]: # (BEGIN_TF_DOCS)


## Usage

Example:

```hcl
module "k8s_iam_hyperapp" {
  source                = "github.com/andreswebs/terraform-aws-eks-irsa"
  k8s_sa_name           = "hyperapp"
  k8s_sa_namespace      = "frontend"
  role_name             = "hyperapp-${var.cluster_name}"
  cluster_oidc_provider = var.cluster_oidc_provider
}
```



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assume_role_extra_docs"></a> [assume\_role\_extra\_docs](#input\_assume\_role\_extra\_docs) | (Optional) Extra IAM policy documents in JSON format, to be merged with the default | `list(string)` | `[]` | no |
| <a name="input_cluster_oidc_provider"></a> [cluster\_oidc\_provider](#input\_cluster\_oidc\_provider) | OpenID Connect (OIDC) Identity Provider associated with the Kubernetes cluster | `string` | n/a | yes |
| <a name="input_create_role"></a> [create\_role](#input\_create\_role) | Create IAM role? | `bool` | `true` | no |
| <a name="input_force_detach_policies"></a> [force\_detach\_policies](#input\_force\_detach\_policies) | Detach policies from this role when destroying? | `bool` | `true` | no |
| <a name="input_k8s_sa_name"></a> [k8s\_sa\_name](#input\_k8s\_sa\_name) | Name of the Kubernetes service account | `string` | `"default"` | no |
| <a name="input_k8s_sa_namespace"></a> [k8s\_sa\_namespace](#input\_k8s\_sa\_namespace) | Namespace of the Kubernetes service account | `string` | `"default"` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | Maximum CLI/API session duration in seconds between 3600 and 43200 | `number` | `null` | no |
| <a name="input_role_description"></a> [role\_description](#input\_role\_description) | IAM role description | `string` | `null` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | IAM role name | `string` | `null` | no |
| <a name="input_role_name_prefix"></a> [role\_name\_prefix](#input\_role\_name\_prefix) | Name prefix for IAM role | `string` | `null` | no |
| <a name="input_role_path"></a> [role\_path](#input\_role\_path) | IAM role path | `string` | `"/"` | no |
| <a name="input_role_permissions_boundary_arn"></a> [role\_permissions\_boundary\_arn](#input\_role\_permissions\_boundary\_arn) | Permissions boundary ARN to use for IAM role | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add the the IAM role | `map(string)` | `{}` | no |

## Modules

No modules.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_policy_document"></a> [iam\_policy\_document](#output\_iam\_policy\_document) | IAM trust policy data |
| <a name="output_iam_role"></a> [iam\_role](#output\_iam\_role) | IAM Role |
| <a name="output_k8s_sa_name"></a> [k8s\_sa\_name](#output\_k8s\_sa\_name) | Name of the Kubernetes service account |
| <a name="output_k8s_sa_namespace"></a> [k8s\_sa\_namespace](#output\_k8s\_sa\_namespace) | Namespace of the Kubernetes service account |
| <a name="output_oidc_provider"></a> [oidc\_provider](#output\_oidc\_provider) | Cluster OIDC provider |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.50 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.50 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

[//]: # (END_TF_DOCS)

## Authors

**Andre Silva** - [@andreswebs](https://github.com/andreswebs)

## License

This project is licensed under the [Unlicense](UNLICENSE.md).
