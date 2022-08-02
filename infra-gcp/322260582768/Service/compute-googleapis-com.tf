resource "google_project_service" "compute_googleapis_com" {
  project = "322260582768"
  service = "compute.googleapis.com"
}
# terraform import google_project_service.compute_googleapis_com 322260582768/compute.googleapis.com
