resource "google_project_service" "cloudapis_googleapis_com" {
  project = "322260582768"
  service = "cloudapis.googleapis.com"
}
# terraform import google_project_service.cloudapis_googleapis_com 322260582768/cloudapis.googleapis.com
