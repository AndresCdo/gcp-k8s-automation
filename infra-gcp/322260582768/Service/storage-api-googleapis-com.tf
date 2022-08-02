resource "google_project_service" "storage_api_googleapis_com" {
  project = "322260582768"
  service = "storage-api.googleapis.com"
}
# terraform import google_project_service.storage_api_googleapis_com 322260582768/storage-api.googleapis.com
