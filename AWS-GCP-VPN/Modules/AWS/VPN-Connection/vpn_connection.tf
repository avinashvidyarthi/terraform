resource "aws_vpn_connection" "vpn_connection" {
  count               = length(var.customer_gateway_ids)
  vpn_gateway_id      = var.vpn_gateway_id
  customer_gateway_id = element(var.customer_gateway_ids, count.index)
  type                = "ipsec.1"
}
