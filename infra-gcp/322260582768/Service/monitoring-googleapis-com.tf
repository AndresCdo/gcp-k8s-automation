resource "google_project_service" "monitoring_googleapis_com" {
  project = "322260582768"
  service = "monitoring.googleapis.com"
}
# terraform import google_project_service.monitoring_googleapis_com 322260582768/monitoring.googleapis.com
