resource "google_project_service" "iam_googleapis_com" {
  project = "322260582768"
  service = "iam.googleapis.com"
}
# terraform import google_project_service.iam_googleapis_com 322260582768/iam.googleapis.com
