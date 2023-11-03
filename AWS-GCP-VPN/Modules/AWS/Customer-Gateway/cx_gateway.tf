data "local_file" "ip_file" {
  filename = "gcp_gateway_ips" # Replace with the actual path to your file
}

resource "aws_customer_gateway" "customer_gateway_01" {
  bgp_asn    = var.bgp_asn
  ip_address = jsondecode(data.local_file.ip_file.content).vpnInterfaces[0].ipAddress
  type       = "ipsec.1"
}

resource "aws_customer_gateway" "customer_gateway_02" {
  bgp_asn    = var.bgp_asn
  ip_address = jsondecode(data.local_file.ip_file.content).vpnInterfaces[1].ipAddress
  type       = "ipsec.1"
}
