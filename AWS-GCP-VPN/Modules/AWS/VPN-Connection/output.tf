output "tunnel_addresses" {
  value = [aws_vpn_connection.vpn_connection[0].tunnel1_address,
    aws_vpn_connection.vpn_connection[0].tunnel2_address,
    aws_vpn_connection.vpn_connection[1].tunnel1_address,
  aws_vpn_connection.vpn_connection[1].tunnel2_address]
}

output "tunnel_details" {
  value = [
    {
      name               = "tunnel-01"
      cgw_inside_address = aws_vpn_connection.vpn_connection[0].tunnel1_cgw_inside_address
      vgw_inside_address = aws_vpn_connection.vpn_connection[0].tunnel1_vgw_inside_address
      preshared_key      = aws_vpn_connection.vpn_connection[0].tunnel1_preshared_key
      bgp_asn            = aws_vpn_connection.vpn_connection[0].tunnel1_bgp_asn
      tunnel_address     = aws_vpn_connection.vpn_connection[0].tunnel1_address
      }, {
      name               = "tunnel-02"
      cgw_inside_address = aws_vpn_connection.vpn_connection[0].tunnel2_cgw_inside_address
      vgw_inside_address = aws_vpn_connection.vpn_connection[0].tunnel2_vgw_inside_address
      preshared_key      = aws_vpn_connection.vpn_connection[0].tunnel2_preshared_key
      bgp_asn            = aws_vpn_connection.vpn_connection[0].tunnel2_bgp_asn
      tunnel_address     = aws_vpn_connection.vpn_connection[0].tunnel2_address
      }, {
      name               = "tunnel-03"
      cgw_inside_address = aws_vpn_connection.vpn_connection[1].tunnel1_cgw_inside_address
      vgw_inside_address = aws_vpn_connection.vpn_connection[1].tunnel1_vgw_inside_address
      preshared_key      = aws_vpn_connection.vpn_connection[1].tunnel1_preshared_key
      bgp_asn            = aws_vpn_connection.vpn_connection[1].tunnel1_bgp_asn
      tunnel_address     = aws_vpn_connection.vpn_connection[1].tunnel1_address
      }, {
      name               = "tunnel-04"
      cgw_inside_address = aws_vpn_connection.vpn_connection[1].tunnel2_cgw_inside_address
      vgw_inside_address = aws_vpn_connection.vpn_connection[1].tunnel2_vgw_inside_address
      preshared_key      = aws_vpn_connection.vpn_connection[1].tunnel2_preshared_key
      bgp_asn            = aws_vpn_connection.vpn_connection[1].tunnel2_bgp_asn
      tunnel_address     = aws_vpn_connection.vpn_connection[1].tunnel2_address
    }
  ]
}
