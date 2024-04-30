variable "project_prefix" {
  type        = string
  description = "prefix string put in front of string"
}

variable "project_suffix" {
  type        = string
  description = "prefix string put at the end of string"
}

variable "f5xc_api_p12_file" {
  description = "F5 XC API certificate file"
  type        = string
}

variable "f5xc_api_p12_cert_password" {
  description = "F5 XC API certificate file password"
  type        = string
  default     = ""
}

variable "f5xc_api_url" {
  description = "F5 XC API URL"
  type        = string
}

variable "f5xc_api_token" {
  description = "F5 XC API token"
  type        = string
}

variable "f5xc_tenant" {
  description = "F5 XC Tenant name"
  type        = string
}

variable "f5xc_namespace" {
  description = "F5 XC namespace name"
  type        = string
  default     = "system"
}

variable "f5xc_cluster_name" {
  description = "F5 XC CE cluster name"
  type        = string
}

variable "owner" {
  description = "GCP tag owner email address"
  type        = string
}

variable "f5xc_ce_gateway_type" {
  description = "F5 XC CE gateway type"
  type        = string
  default     = "ingress_gateway"
}

variable "f5xc_cluster_latitude" {
  description = "F5 XC CE geo latitude"
  type        = number
  default     = -73.935242
}

variable "f5xc_cluster_longitude" {
  description = "F5 XC CE geo longitude"
  type        = number
  default     = 40.730610
}

variable "ssh_public_key_file" {
  description = "path to ssh public key file"
  type        = string
}

variable "gcp_project_id" {
  description = "GCP account project id"
  type        = string
}

variable "gcp_application_credentials" {
  description = "GCP account credentials"
  type        = string
  default     = ""
}

variable "gcp_instance_type" {
  type    = string
  default = "n1-standard-4"
}

variable "gcp_instance_disk_size" {
  type    = string
  default = "40"
}

variable "gcp_region" {
  type = string
}

variable "gcp_zone" {
  type = string
}

variable "gcp_instance_image" {
  type = string
}

variable "gcp_existing_network_slo" {
  description = "existing gcp network name slo"
  type        = string
}

# variable "gcp_existing_network_sli" {
#   description = "existing gcp network name sli"
#   type        = string
# }

variable "gcp_existing_subnet_network_slo" {
  description = "existing gcp subnetwork name slo"
  type        = string
}

# variable "gcp_existing_subnet_network_sli" {
#   description = "existing gcp subnetwork name sli"
#   type        = string
# }