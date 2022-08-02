resource "google_bigquery_dataset" "lottery_results" {
  access {
    role          = "OWNER"
    special_group = "projectOwners"
  }

  access {
    role          = "OWNER"
    user_by_email = "Andrezz1997@gmail.com"
  }

  access {
    role          = "READER"
    special_group = "projectReaders"
  }

  access {
    role          = "WRITER"
    special_group = "projectWriters"
  }

  dataset_id                 = "lottery_results"
  delete_contents_on_destroy = false
  location                   = "southamerica-east1"
  project                    = "cellular-codex-352520"
}
# terraform import google_bigquery_dataset.lottery_results projects/cellular-codex-352520/datasets/lottery_results
