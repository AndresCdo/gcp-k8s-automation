resource "google_compute_global_address" "default_ip_range" {
  address       = "10.104.16.0"
  address_type  = "INTERNAL"
  name          = "default-ip-range"
  network       = "https://www.googleapis.com/compute/v1/projects/cellular-codex-352520/global/networks/default"
  prefix_length = 20
  project       = "cellular-codex-352520"
  purpose       = "VPC_PEERING"
}
# terraform import google_compute_global_address.default_ip_range projects/cellular-codex-352520/global/addresses/default-ip-range
