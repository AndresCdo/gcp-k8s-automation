resource "google_project_service" "storage_googleapis_com" {
  project = "322260582768"
  service = "storage.googleapis.com"
}
# terraform import google_project_service.storage_googleapis_com 322260582768/storage.googleapis.com
