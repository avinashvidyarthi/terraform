module "gcp_external_gateway" {
  source                        = "./Modules/GCP/External-Gateway"
  tunnel_addresses              = module.aws_vpn_connection.tunnel_addresses
  gcp_external_vpn_gateway_name = var.gcp_external_vpn_gateway_name
  depends_on                    = [module.aws_vpn_connection]
}
