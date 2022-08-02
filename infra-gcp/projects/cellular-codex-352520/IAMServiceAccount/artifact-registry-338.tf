resource "google_service_account" "artifact_registry_338" {
  account_id   = "artifact-registry-338"
  description  = "Cuenta de servicio de Artifact Registry"
  display_name = "Artifact-registry"
  project      = "cellular-codex-352520"
}
# terraform import google_service_account.artifact_registry_338 projects/cellular-codex-352520/serviceAccounts/artifact-registry-338@cellular-codex-352520.iam.gserviceaccount.com
