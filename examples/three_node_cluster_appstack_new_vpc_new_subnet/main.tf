locals {
  custom_tags = {
    Owner         = var.owner
    f5xc-tenant   = var.f5xc_tenant
    f5xc-template = "f5xc_gcp_cloud_ce_three_node_appstack_single_nic_new_vpc_new_subnet"
  }
}

module "f5xc_gcp_cloud_ce_three_node_appstack_single_nic_new_vpc_new_subnet" {
  source                 = "../../modules/f5xc/ce/appstack/gcp"
  is_sensitive           = false
  status_check_type      = "cert"
  gcp_region             = var.gcp_region
  gcp_instance_tags      = []
  gcp_instance_type      = var.gcp_instance_type
  gcp_instance_image     = var.gcp_instance_image
  gcp_instance_disk_size = var.gcp_instance_disk_size
  f5xc_tenant            = var.f5xc_tenant
  f5xc_api_url           = var.f5xc_api_url
  f5xc_api_token         = var.f5xc_api_token
  f5xc_namespace         = var.f5xc_namespace
  f5xc_token_name        = format("%s-%s-%s", var.project_prefix, var.f5xc_cluster_name, var.project_suffix)
  f5xc_cluster_name      = format("%s-%s-%s", var.project_prefix, var.f5xc_cluster_name, var.project_suffix)
  f5xc_ce_slo_subnet     = var.f5xc_ce_slo_subnet
  f5xc_api_p12_file      = var.f5xc_api_p12_file
  f5xc_cluster_nodes = {
    master = {
      node0 = {
        az = format("%s-%s", var.gcp_region, var.gcp_zone_master_node0)
      }
      node1 = {
        az = format("%s-%s", var.gcp_region, var.gcp_zone_master_node1)
      }
      node2 = {
        az = format("%s-%s", var.gcp_region, var.gcp_zone_master_node2)
      }
    }
    worker = {
      worker0 = {
        az = format("%s-%s", var.gcp_region, var.gcp_zone_worker_node0)
      }
      worker1 = {
        az = format("%s-%s", var.gcp_region, var.gcp_zone_worker_node1)
      }
      worker2 = {
        az = format("%s-%s", var.gcp_region, var.gcp_zone_worker_node2)
      }
    }
  }
  f5xc_ce_gateway_type       = var.f5xc_ce_gateway_type
  f5xc_cluster_latitude      = var.f5xc_cluster_latitude
  f5xc_cluster_longitude     = var.f5xc_cluster_longitude
  f5xc_api_p12_cert_password = var.f5xc_api_p12_cert_password
  ssh_public_key             = file(var.ssh_public_key_file)
  providers = {
    google   = google.default
    volterra = volterra.default
  }
}

output "f5xc_gcp_cloud_ce_three_node_appstack_single_nic_new_vpc_new_subnet" {
  value = module.f5xc_gcp_cloud_ce_three_node_appstack_single_nic_new_vpc_new_subnet
}