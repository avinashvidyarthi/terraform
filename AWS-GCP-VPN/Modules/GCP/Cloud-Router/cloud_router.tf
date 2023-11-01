resource "google_compute_router" "cloud_router" {
  name    = var.router_name
  network = var.vpc_id
  bgp {
    asn = var.bgp_asn
  }
}
