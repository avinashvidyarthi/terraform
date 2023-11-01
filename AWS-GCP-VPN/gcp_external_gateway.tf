module "gcp_external_gateway" {
  source           = "./Modules/GCP/External-Gateway"
  tunnel_addresses = module.aws_vpn_connection.tunnel_addresses
  depends_on = [ module.aws_vpn_connection]
}
