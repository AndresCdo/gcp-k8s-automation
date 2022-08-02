resource "google_project_service" "cloudscheduler_googleapis_com" {
  project = "322260582768"
  service = "cloudscheduler.googleapis.com"
}
# terraform import google_project_service.cloudscheduler_googleapis_com 322260582768/cloudscheduler.googleapis.com
