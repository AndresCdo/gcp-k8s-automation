resource "google_storage_bucket" "gcf_v2_uploads_322260582768_us_central1" {
  cors {
    method          = ["PUT"]
    origin          = ["https://*.cloud.google.com", "https://*.corp.google.com", "https://*.corp.google.com:*"]
    response_header = ["content-type"]
  }

  force_destroy = false

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age        = 1
      with_state = "ANY"
    }
  }

  location                    = "US-CENTRAL1"
  name                        = "gcf-v2-uploads-322260582768-us-central1"
  project                     = "cellular-codex-352520"
  public_access_prevention    = "inherited"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
}
# terraform import google_storage_bucket.gcf_v2_uploads_322260582768_us_central1 gcf-v2-uploads-322260582768-us-central1
