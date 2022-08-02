resource "google_storage_bucket" "gcf_sources_322260582768_us_central1" {
  cors {
    method = ["GET"]
    origin = ["https://*.cloud.google.com", "https://*.corp.google.com", "https://*.corp.google.com:*"]
  }

  force_destroy               = false
  location                    = "US-CENTRAL1"
  name                        = "gcf-sources-322260582768-us-central1"
  project                     = "cellular-codex-352520"
  public_access_prevention    = "inherited"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
}
# terraform import google_storage_bucket.gcf_sources_322260582768_us_central1 gcf-sources-322260582768-us-central1
