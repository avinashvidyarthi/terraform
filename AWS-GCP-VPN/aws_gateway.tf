module "aws_vpn_gateway" {
  source          = "./Modules/AWS/VPN-Gateway"
  vpc_id          = var.aws_info.vpc_id
  route_table_ids = var.aws_info.route_table_ids
}
