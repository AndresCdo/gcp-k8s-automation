resource "google_project_service" "oslogin_googleapis_com" {
  project = "322260582768"
  service = "oslogin.googleapis.com"
}
# terraform import google_project_service.oslogin_googleapis_com 322260582768/oslogin.googleapis.com
