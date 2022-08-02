resource "google_storage_bucket" "us_artifacts_cellular_codex_352520_appspot_com" {
  force_destroy            = false
  location                 = "US"
  name                     = "us.artifacts.cellular-codex-352520.appspot.com"
  project                  = "cellular-codex-352520"
  public_access_prevention = "inherited"
  storage_class            = "STANDARD"
}
# terraform import google_storage_bucket.us_artifacts_cellular_codex_352520_appspot_com us.artifacts.cellular-codex-352520.appspot.com
