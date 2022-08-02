resource "google_project_service" "autoscaling_googleapis_com" {
  project = "322260582768"
  service = "autoscaling.googleapis.com"
}
# terraform import google_project_service.autoscaling_googleapis_com 322260582768/autoscaling.googleapis.com
