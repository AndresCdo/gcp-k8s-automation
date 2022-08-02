resource "google_project_service" "pubsub_googleapis_com" {
  project = "322260582768"
  service = "pubsub.googleapis.com"
}
# terraform import google_project_service.pubsub_googleapis_com 322260582768/pubsub.googleapis.com
