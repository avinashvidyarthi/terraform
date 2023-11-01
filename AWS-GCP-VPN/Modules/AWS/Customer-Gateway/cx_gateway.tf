data "local_file" "ip_file" {
  filename = "gcp_gateway_ips" # Replace with the actual path to your file
}

resource "aws_customer_gateway" "customer_gateway_01" {
  bgp_asn    = var.bgp_asn
  ip_address = split(";", split("\n", data.local_file.ip_file.content)[0])[0]
  type       = "ipsec.1"
}

resource "aws_customer_gateway" "customer_gateway_02" {
  bgp_asn    = var.bgp_asn
  ip_address = split(";", split("\n", data.local_file.ip_file.content)[0])[1]
  type       = "ipsec.1"
}
