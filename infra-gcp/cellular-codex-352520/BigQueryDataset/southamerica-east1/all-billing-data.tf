resource "google_bigquery_dataset" "all_billing_data" {
  access {
    role          = "OWNER"
    special_group = "projectOwners"
  }

  access {
    role          = "OWNER"
    user_by_email = "Andrezz1997@gmail.com"
  }

  access {
    role          = "OWNER"
    user_by_email = "billing-export-bigquery@system.gserviceaccount.com"
  }

  access {
    role          = "READER"
    special_group = "projectReaders"
  }

  access {
    role          = "WRITER"
    special_group = "projectWriters"
  }

  dataset_id                 = "all_billing_data"
  delete_contents_on_destroy = false
  location                   = "southamerica-east1"
  project                    = "cellular-codex-352520"
}
# terraform import google_bigquery_dataset.all_billing_data projects/cellular-codex-352520/datasets/all_billing_data
