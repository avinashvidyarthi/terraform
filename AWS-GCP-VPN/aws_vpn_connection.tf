module "aws_vpn_connection" {
  source               = "./Modules/AWS/VPN-Connection"
  vpn_gateway_id       = module.aws_vpn_gateway.vpn_gateway_id
  customer_gateway_ids = module.aws_cx_gateway.customer_gateway_ids
  depends_on           = [module.aws_cx_gateway, module.aws_vpn_gateway]
}
