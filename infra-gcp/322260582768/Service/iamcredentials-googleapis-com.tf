resource "google_project_service" "iamcredentials_googleapis_com" {
  project = "322260582768"
  service = "iamcredentials.googleapis.com"
}
# terraform import google_project_service.iamcredentials_googleapis_com 322260582768/iamcredentials.googleapis.com
