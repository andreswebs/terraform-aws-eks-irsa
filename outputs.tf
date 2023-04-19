output "k8s_sa_name" {
  value       = var.k8s_sa_name
  description = "Name of the Kubernetes service account"
}

output "k8s_sa_namespace" {
  value       = var.k8s_sa_namespace
  description = "Namespace of the Kubernetes namespace"
}

output "oidc_provider" {
  value       = local.oidc_provider
  description = "Cluster OIDC provider"
}

output "iam_policy_document" {
  value       = data.aws_iam_policy_document.this
  description = "IAM trust policy data"
}

output "iam_role" {
  value       = var.create_role ? aws_iam_role.this[0] : null
  description = "IAM Role"
}
