resource "google_project_service" "run_googleapis_com" {
  project = "322260582768"
  service = "run.googleapis.com"
}
# terraform import google_project_service.run_googleapis_com 322260582768/run.googleapis.com
