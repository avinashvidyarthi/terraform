resource "google_compute_external_vpn_gateway" "external_gateway" {
  name            = "external-gateway"
  redundancy_type = "FOUR_IPS_REDUNDANCY"
  description     = "An externally managed VPN gateway"

  interface {
    id         = 0
    ip_address = var.tunnel_addresses[0]
  }
  
  interface {
    id         = 1
    ip_address = var.tunnel_addresses[1]
  }
  
  interface {
    id         = 2
    ip_address = var.tunnel_addresses[2]
  }
  
  interface {
    id         = 3
    ip_address = var.tunnel_addresses[3]
  }
}
