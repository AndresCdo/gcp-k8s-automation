resource "google_project_service" "sqladmin_googleapis_com" {
  project = "322260582768"
  service = "sqladmin.googleapis.com"
}
# terraform import google_project_service.sqladmin_googleapis_com 322260582768/sqladmin.googleapis.com
