resource "google_project_service" "dataproc_googleapis_com" {
  project = "322260582768"
  service = "dataproc.googleapis.com"
}
# terraform import google_project_service.dataproc_googleapis_com 322260582768/dataproc.googleapis.com
