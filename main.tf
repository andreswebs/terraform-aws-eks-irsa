data "aws_partition" "current" {}
data "aws_caller_identity" "current" {}

locals {
  oidc_provider = replace(var.cluster_oidc_provider, "https://", "")
  account_id    = data.aws_caller_identity.current.account_id
  partition     = data.aws_partition.current.partition
}

data "aws_iam_policy_document" "this" {

  statement {

    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = ["arn:${local.partition}:iam::${local.account_id}:oidc-provider/${local.oidc_provider}"]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.oidc_provider}:sub"
      values   = ["system:serviceaccount:${var.k8s_sa_namespace}:${var.k8s_sa_name}"]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.oidc_provider}:aud"
      values   = ["sts.amazonaws.com"]
    }

  }
}

resource "aws_iam_role" "this" {
  count = var.create_role ? 1 : 0

  name        = var.role_name
  name_prefix = var.role_name_prefix
  path        = var.role_path
  description = var.role_description

  assume_role_policy    = data.aws_iam_policy_document.this.json
  max_session_duration  = var.max_session_duration
  permissions_boundary  = var.role_permissions_boundary_arn
  force_detach_policies = var.force_detach_policies

  tags = var.tags
}
