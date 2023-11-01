module "gcp_ha_vpn" {
  source              = "./Modules/GCP/HA-VPN-Gateway"
  gcp_region          = var.gcp_info.region
  ha_vpn_gateway_name = var.gcp_ha_vpn_gateway.name
  gcp_vpc_id          = "projects/${var.gcp_info.project_id}/global/networks/${var.gcp_info.vpc_name}"
}
