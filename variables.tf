variable "k8s_sa_name" {
  type        = string
  description = "Name of the Kubernetes service account"
  default     = "default"
}

variable "k8s_sa_namespace" {
  type        = string
  description = "Namespace of the Kubernetes service account"
  default     = "default"
}

variable "cluster_oidc_provider" {
  type        = string
  description = "OpenID Connect (OIDC) Identity Provider associated with the Kubernetes cluster"
}

variable "create_role" {
  type        = bool
  description = "Create IAM role?"
  default     = true
}

variable "role_name" {
  description = "IAM role name"
  type        = string
  default     = null
}

variable "role_name_prefix" {
  description = "Name prefix for IAM role"
  type        = string
  default     = null
}

variable "role_path" {
  description = "IAM role path"
  type        = string
  default     = "/"
}

variable "role_permissions_boundary_arn" {
  description = "Permissions boundary ARN to use for IAM role"
  type        = string
  default     = null
}

variable "role_description" {
  description = "IAM role description"
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to add the the IAM role"
  type        = map(string)
  default     = {}
}

variable "force_detach_policies" {
  description = "Detach policies from this role when destroying?"
  type        = bool
  default     = true
}

variable "max_session_duration" {
  description = "Maximum CLI/API session duration in seconds between 3600 and 43200"
  type        = number
  default     = null
}

variable "assume_role_extra_docs" {
  description = "(Optional) Extra IAM policy documents in JSON format, to be merged with the default"
  type        = list(string)
  default     = []
}
