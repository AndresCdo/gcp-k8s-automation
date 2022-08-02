resource "google_project_service" "logging_googleapis_com" {
  project = "322260582768"
  service = "logging.googleapis.com"
}
# terraform import google_project_service.logging_googleapis_com 322260582768/logging.googleapis.com
