resource "google_service_account" "322260582768_compute" {
  account_id   = "322260582768-compute"
  display_name = "Compute Engine default service account"
  project      = "cellular-codex-352520"
}
# terraform import google_service_account.322260582768_compute projects/cellular-codex-352520/serviceAccounts/322260582768-compute@cellular-codex-352520.iam.gserviceaccount.com
