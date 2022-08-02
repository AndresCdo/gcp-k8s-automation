resource "google_pubsub_topic" "recollected_results" {
  name    = "recollected-results"
  project = "cellular-codex-352520"
}
# terraform import google_pubsub_topic.recollected_results projects/cellular-codex-352520/topics/recollected-results
