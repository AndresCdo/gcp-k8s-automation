resource "google_project_service" "cloudtrace_googleapis_com" {
  project = "322260582768"
  service = "cloudtrace.googleapis.com"
}
# terraform import google_project_service.cloudtrace_googleapis_com 322260582768/cloudtrace.googleapis.com
