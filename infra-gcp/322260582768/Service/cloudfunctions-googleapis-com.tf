resource "google_project_service" "cloudfunctions_googleapis_com" {
  project = "322260582768"
  service = "cloudfunctions.googleapis.com"
}
# terraform import google_project_service.cloudfunctions_googleapis_com 322260582768/cloudfunctions.googleapis.com
