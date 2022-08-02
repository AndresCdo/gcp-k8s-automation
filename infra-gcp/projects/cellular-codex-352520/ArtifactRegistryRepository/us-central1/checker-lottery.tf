resource "google_artifact_registry_repository" "checker_lottery" {
  description   = "Imagen del programa Python para web scraping"
  format        = "DOCKER"
  location      = "us-central1"
  project       = "cellular-codex-352520"
  repository_id = "checker-lottery"
}
# terraform import google_artifact_registry_repository.checker_lottery projects/cellular-codex-352520/locations/us-central1/repositories/checker-lottery
