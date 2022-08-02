resource "google_project_service" "datastore_googleapis_com" {
  project = "322260582768"
  service = "datastore.googleapis.com"
}
# terraform import google_project_service.datastore_googleapis_com 322260582768/datastore.googleapis.com
