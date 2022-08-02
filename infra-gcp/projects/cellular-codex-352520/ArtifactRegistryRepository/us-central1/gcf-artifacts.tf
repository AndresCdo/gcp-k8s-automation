resource "google_artifact_registry_repository" "gcf_artifacts" {
  description = "This repository is created and used by Cloud Functions for storing function docker images."
  format      = "DOCKER"

  labels = {
    goog-managed-by = "cloudfunctions"
  }

  location      = "us-central1"
  project       = "cellular-codex-352520"
  repository_id = "gcf-artifacts"
}
# terraform import google_artifact_registry_repository.gcf_artifacts projects/cellular-codex-352520/locations/us-central1/repositories/gcf-artifacts
