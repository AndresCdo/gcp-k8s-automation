resource "google_service_account" "user_service_accounts" {
  account_id   = "user-service-accounts"
  description  = "Usuario de cuentas de servicio"
  display_name = "user-service-accounts"
  project      = "cellular-codex-352520"
}
# terraform import google_service_account.user_service_accounts projects/cellular-codex-352520/serviceAccounts/user-service-accounts@cellular-codex-352520.iam.gserviceaccount.com
