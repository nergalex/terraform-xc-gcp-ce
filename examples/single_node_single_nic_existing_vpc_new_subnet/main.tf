locals {
  custom_tags = {
    Owner         = var.owner
    f5xc-tenant   = var.f5xc_tenant
    f5xc-template = "f5xc_gcp_cloud_ce_single_node_single_nic_existing_vpc_new_subnet"
  }
}

module "vpc_slo" {
  source       = "terraform-google-modules/network/google"
  mtu          = 1460
  version      = "~> 6.0"
  project_id   = var.gcp_project_id
  network_name = "${var.project_prefix}-${var.f5xc_cluster_name}-vpc-slo-${var.gcp_region}-${var.project_suffix}"
  subnets      = [
    {
      subnet_name   = "${var.project_prefix}-${var.f5xc_cluster_name}-slo-${var.gcp_region}-${var.project_suffix}"
      subnet_ip     = "192.168.1.0/24"
      subnet_region = var.gcp_region
    }
  ]
  providers = {
    google = google.default
  }
}

module "vpc_sli" {
  source       = "terraform-google-modules/network/google"
  version      = "~> 6.0"
  project_id   = var.gcp_project_id
  network_name = "${var.project_prefix}-${var.f5xc_cluster_name}-vpc-sli-${var.gcp_region}-${var.project_suffix}"
  mtu          = 1460
  subnets      = [
    {
      subnet_name   = "${var.project_prefix}-${var.f5xc_cluster_name}-sli-${var.gcp_region}-${var.project_suffix}"
      subnet_ip     = "192.168.2.0/24"
      subnet_region = var.gcp_region
    }
  ]
  delete_default_internet_gateway_routes = true
}

module "f5xc_gcp_cloud_ce_single_node_single_nic_existing_vpc_new_subnet" {
  depends_on                 = [module.vpc_sli, module.vpc_slo]
  source                     = "../../modules/f5xc/ce/gcp"
  owner                      = var.owner
  is_sensitive               = false
  has_public_ip              = true
  ssh_public_key             = file(var.ssh_public_key_file)
  status_check_type          = "cert"
  gcp_region                 = var.gcp_region
  gcp_project_id             = var.gcp_project_id
  gcp_instance_type          = var.gcp_instance_type
  gcp_instance_image         = var.gcp_instance_image
  gcp_instance_disk_size     = var.gcp_instance_disk_size
  gcp_existing_network_slo = module.vpc_slo.network_name #var.gcp_existing_network_slo
  f5xc_tenant                = var.f5xc_tenant
  f5xc_api_url               = var.f5xc_api_url
  f5xc_namespace             = var.f5xc_namespace
  f5xc_api_token             = var.f5xc_api_token
  f5xc_token_name            = format("%s-%s-%s", var.project_prefix, var.f5xc_cluster_name, var.project_suffix)
  f5xc_cluster_name          = format("%s-%s-%s", var.project_prefix, var.f5xc_cluster_name, var.project_suffix)
  f5xc_api_p12_file          = var.f5xc_api_p12_file
  f5xc_ce_slo_subnet         = var.f5xc_ce_slo_subnet
  f5xc_ce_gateway_type       = var.f5xc_ce_gateway_type
  f5xc_api_p12_cert_password = var.f5xc_api_p12_cert_password
  f5xc_ce_nodes = {
    node0 = {
      az = format("%s-%s", var.gcp_region, var.gcp_zone)
    }
  }
  providers = {
    google   = google.default
    volterra = volterra.default
  }
}

output "f5xc_gcp_cloud_ce_single_node_single_nic_existing_vpc_new_subnet" {
  value = module.f5xc_gcp_cloud_ce_single_node_single_nic_existing_vpc_new_subnet
}