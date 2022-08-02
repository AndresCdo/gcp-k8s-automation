resource "google_project_service" "container_googleapis_com" {
  project = "322260582768"
  service = "container.googleapis.com"
}
# terraform import google_project_service.container_googleapis_com 322260582768/container.googleapis.com
