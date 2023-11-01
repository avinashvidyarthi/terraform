resource "google_compute_vpn_tunnel" "tunnel1" {
  name                            = var.tunnel_details[0].name
  shared_secret                   = var.tunnel_details[0].preshared_key
  vpn_gateway                     = var.ha_vpn_gateway_id
  vpn_gateway_interface           = 0
  peer_external_gateway           = var.gcp_external_gateway_id
  peer_external_gateway_interface = 0
  router                          = var.cloud_router_id
}

resource "google_compute_vpn_tunnel" "tunnel2" {
  name                            = var.tunnel_details[1].name
  shared_secret                   = var.tunnel_details[1].preshared_key
  vpn_gateway                     = var.ha_vpn_gateway_id
  vpn_gateway_interface           = 0
  peer_external_gateway           = var.gcp_external_gateway_id
  peer_external_gateway_interface = 1
  router                          = var.cloud_router_id
}

resource "google_compute_vpn_tunnel" "tunnel3" {
  name                            = var.tunnel_details[2].name
  shared_secret                   = var.tunnel_details[2].preshared_key
  vpn_gateway                     = var.ha_vpn_gateway_id
  vpn_gateway_interface           = 1
  peer_external_gateway           = var.gcp_external_gateway_id
  peer_external_gateway_interface = 2
  router                          = var.cloud_router_id
}

resource "google_compute_vpn_tunnel" "tunnel4" {
  name                            = var.tunnel_details[3].name
  shared_secret                   = var.tunnel_details[3].preshared_key
  vpn_gateway                     = var.ha_vpn_gateway_id
  vpn_gateway_interface           = 1
  peer_external_gateway           = var.gcp_external_gateway_id
  peer_external_gateway_interface = 3
  router                          = var.cloud_router_id
}


resource "google_compute_router_interface" "cloud_router_interface_01" {
  name       = "${var.tunnel_details[0].name}-interface"
  router     = var.cloud_router_name
  vpn_tunnel = google_compute_vpn_tunnel.tunnel1.name
}

resource "google_compute_router_peer" "peer_01" {
  name            = "${var.tunnel_details[0].name}-peer"
  router          = var.cloud_router_name
  peer_asn        = var.tunnel_details[0].bgp_asn
  interface       = google_compute_router_interface.cloud_router_interface_01.name
  ip_address      = var.tunnel_details[0].cgw_inside_address
  peer_ip_address = var.tunnel_details[0].vgw_inside_address
}

resource "google_compute_router_interface" "cloud_router_interface_02" {
  name       = "${var.tunnel_details[1].name}-interface"
  router     = var.cloud_router_name
  vpn_tunnel = google_compute_vpn_tunnel.tunnel2.name
}

resource "google_compute_router_peer" "peer_02" {
  name            = "${var.tunnel_details[1].name}-peer"
  router          = var.cloud_router_name
  peer_asn        = var.tunnel_details[1].bgp_asn
  interface       = google_compute_router_interface.cloud_router_interface_02.name
  ip_address      = var.tunnel_details[1].cgw_inside_address
  peer_ip_address = var.tunnel_details[1].vgw_inside_address
}

resource "google_compute_router_interface" "cloud_router_interface_03" {
  name       = "${var.tunnel_details[2].name}-interface"
  router     = var.cloud_router_name
  vpn_tunnel = google_compute_vpn_tunnel.tunnel3.name
}

resource "google_compute_router_peer" "peer_03" {
  name            = "${var.tunnel_details[2].name}-peer"
  router          = var.cloud_router_name
  peer_asn        = var.tunnel_details[2].bgp_asn
  interface       = google_compute_router_interface.cloud_router_interface_03.name
  ip_address      = var.tunnel_details[2].cgw_inside_address
  peer_ip_address = var.tunnel_details[2].vgw_inside_address
}

resource "google_compute_router_interface" "cloud_router_interface_04" {
  name       = "${var.tunnel_details[3].name}-interface"
  router     = var.cloud_router_name
  vpn_tunnel = google_compute_vpn_tunnel.tunnel4.name
}

resource "google_compute_router_peer" "peer_04" {
  name            = "${var.tunnel_details[3].name}-peer"
  router          = var.cloud_router_name
  peer_asn        = var.tunnel_details[3].bgp_asn
  interface       = google_compute_router_interface.cloud_router_interface_04.name
  ip_address      = var.tunnel_details[3].cgw_inside_address
  peer_ip_address = var.tunnel_details[3].vgw_inside_address
}
