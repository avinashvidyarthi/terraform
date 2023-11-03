gcp_info = {
  project_id = "avinashvidyarthi"
  region     = "asia-south1"
  vpc_name   = "test-gcp-vpc"
}

aws_info = {
  region          = "ap-south-1"
  profile         = "ayush-aws"
  vpc_id          = "vpc-06302acf05e18c8e3"
  route_table_ids = ["rtb-02611b445eb9c0b49", "rtb-07037ce6ce6e35765"]
}

gcp_ha_vpn_gateway = {
  name = "test-ha-vpn-gateway"
}

gcp_router_bgp_asn = 65000

gcp_external_vpn_gateway_name = "test-gateway"