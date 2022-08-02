resource "google_service_account" "cellular_codex_352520" {
  account_id   = "cellular-codex-352520"
  display_name = "App Engine default service account"
  project      = "cellular-codex-352520"
}
# terraform import google_service_account.cellular_codex_352520 projects/cellular-codex-352520/serviceAccounts/cellular-codex-352520@cellular-codex-352520.iam.gserviceaccount.com
