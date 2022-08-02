resource "google_service_account" "token_maker" {
  account_id   = "token-maker"
  description  = "Creador de token para cuentas de servicio"
  display_name = "Token-maker"
  project      = "cellular-codex-352520"
}
# terraform import google_service_account.token_maker projects/cellular-codex-352520/serviceAccounts/token-maker@cellular-codex-352520.iam.gserviceaccount.com
