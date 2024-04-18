locals {
  custom_tags           = {
    Owner         = var.owner
    f5xc-tenant   = var.f5xc_tenant
    f5xc-template = "f5xc_gcp_cloud_ce_single_node_multi_nic_existing_vpc_and_subnet_slo_no_eip_3rd_party_nat_gw"
  }
}

