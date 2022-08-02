resource "google_service_account" "artifact_registry" {
  account_id   = "artifact-registry"
  description  = "Cuenta para registro de imagenes"
  display_name = "Artifact-registry"
  project      = "cellular-codex-352520"
}
# terraform import google_service_account.artifact_registry projects/cellular-codex-352520/serviceAccounts/artifact-registry@cellular-codex-352520.iam.gserviceaccount.com
