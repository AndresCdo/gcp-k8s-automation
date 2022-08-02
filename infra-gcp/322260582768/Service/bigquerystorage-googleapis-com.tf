resource "google_project_service" "bigquerystorage_googleapis_com" {
  project = "322260582768"
  service = "bigquerystorage.googleapis.com"
}
# terraform import google_project_service.bigquerystorage_googleapis_com 322260582768/bigquerystorage.googleapis.com
