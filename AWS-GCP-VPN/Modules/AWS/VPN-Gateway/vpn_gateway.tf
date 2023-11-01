resource "aws_vpn_gateway" "vpn_gw" {
  vpc_id = var.vpc_id
}

resource "aws_vpn_gateway_route_propagation" "route_table_propagation" {
  count          = length(var.route_table_ids)
  vpn_gateway_id = aws_vpn_gateway.vpn_gw.id
  route_table_id = element(var.route_table_ids, count.index)
}
