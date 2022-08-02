resource "google_project_service" "cloudbuild_googleapis_com" {
  project = "322260582768"
  service = "cloudbuild.googleapis.com"
}
# terraform import google_project_service.cloudbuild_googleapis_com 322260582768/cloudbuild.googleapis.com
