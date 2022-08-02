resource "google_project_service" "datafusion_googleapis_com" {
  project = "322260582768"
  service = "datafusion.googleapis.com"
}
# terraform import google_project_service.datafusion_googleapis_com 322260582768/datafusion.googleapis.com
