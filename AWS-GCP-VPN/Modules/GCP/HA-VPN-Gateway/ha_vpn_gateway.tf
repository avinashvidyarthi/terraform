resource "google_compute_ha_vpn_gateway" "ha_gateway" {
  region  = var.gcp_region
  name    = var.ha_vpn_gateway_name
  network = var.gcp_vpc_id
}

resource "null_resource" "shell" {
  provisioner "local-exec" {
    command = "gcloud compute vpn-gateways describe test-ha-vpn-gateway --region asia-south1 --format=\"value(vpnInterfaces.ipAddress)\" > gcp_gateway_ips;"
  }
  depends_on = [google_compute_ha_vpn_gateway.ha_gateway]
}
