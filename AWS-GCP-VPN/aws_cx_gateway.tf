module "aws_cx_gateway" {
  source     = "./Modules/AWS/Customer-Gateway"
  bgp_asn    = 65000
  depends_on = [module.gcp_ha_vpn]
}
