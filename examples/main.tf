module "k8s_iam_hyperapp" {
  source                = "github.com/andreswebs/terraform-aws-eks-irsa"
  k8s_sa_name           = "hyperapp"
  k8s_sa_namespace      = "frontend"
  role_name             = "hyperapp-${var.cluster_name}"
  cluster_oidc_provider = var.cluster_oidc_provider
}