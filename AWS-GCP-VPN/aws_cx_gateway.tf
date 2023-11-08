module "aws_cx_gateway" {
  source     = "./Modules/AWS/Customer-Gateway"
  bgp_asn    = var.gcp_router_bgp_asn
  depends_on = [module.gcp_ha_vpn]
}
