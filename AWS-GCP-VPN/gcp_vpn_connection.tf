module "gcp_vpn_connection" {
  source                  = "./Modules/GCP/VPN-Connection"
  tunnel_details          = module.aws_vpn_connection.tunnel_details
  cloud_router_id         = module.gcp_cloud_router.cloud_router_id
  cloud_router_name       = module.gcp_cloud_router.cloud_router_name
  ha_vpn_gateway_id       = module.gcp_ha_vpn.ha_vpn_gateway_id
  gcp_external_gateway_id = module.gcp_external_gateway.gcp_external_gateway_id
}