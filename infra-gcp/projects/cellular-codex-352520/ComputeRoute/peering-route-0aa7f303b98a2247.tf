resource "google_compute_route" "peering_route_0aa7f303b98a2247" {
  description = "Auto generated route via peering [servicenetworking-googleapis-com]."
  dest_range  = "10.104.16.0/24"
  name        = "peering-route-0aa7f303b98a2247"
  network     = "https://www.googleapis.com/compute/v1/projects/cellular-codex-352520/global/networks/default"
  priority    = 0
  project     = "cellular-codex-352520"
}
# terraform import google_compute_route.peering_route_0aa7f303b98a2247 projects/cellular-codex-352520/global/routes/peering-route-0aa7f303b98a2247
