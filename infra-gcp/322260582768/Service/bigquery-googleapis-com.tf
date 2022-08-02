resource "google_project_service" "bigquery_googleapis_com" {
  project = "322260582768"
  service = "bigquery.googleapis.com"
}
# terraform import google_project_service.bigquery_googleapis_com 322260582768/bigquery.googleapis.com
