module "gcp_cloud_router" {
  source      = "./Modules/GCP/Cloud-Router"
  vpc_id      = var.gcp_info.vpc_name
  router_name = "vpn-router"
  bgp_asn     = 65000
}
