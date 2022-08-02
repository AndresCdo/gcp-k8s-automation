resource "google_project_service" "serviceusage_googleapis_com" {
  project = "322260582768"
  service = "serviceusage.googleapis.com"
}
# terraform import google_project_service.serviceusage_googleapis_com 322260582768/serviceusage.googleapis.com
