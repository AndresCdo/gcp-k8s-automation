resource "google_storage_bucket" "gcf_v2_sources_322260582768_us_central1" {
  cors {
    method = ["GET"]
    origin = ["https://*.cloud.google.com", "https://*.corp.google.com", "https://*.corp.google.com:*"]
  }

  force_destroy = false

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      num_newer_versions = 3
      with_state         = "ARCHIVED"
    }
  }

  location                    = "US-CENTRAL1"
  name                        = "gcf-v2-sources-322260582768-us-central1"
  project                     = "cellular-codex-352520"
  public_access_prevention    = "inherited"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}
# terraform import google_storage_bucket.gcf_v2_sources_322260582768_us_central1 gcf-v2-sources-322260582768-us-central1
