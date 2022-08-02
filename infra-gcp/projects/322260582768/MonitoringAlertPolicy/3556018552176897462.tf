resource "google_monitoring_alert_policy" "3556018552176897462" {
  combiner = "OR"

  conditions {
    condition_threshold {
      aggregations {
        alignment_period   = "300s"
        per_series_aligner = "ALIGN_MEAN"
      }

      comparison      = "COMPARISON_GT"
      duration        = "300s"
      filter          = "metric.type=\"agent.googleapis.com/memory/percent_used\" AND resource.type=\"gce_instance\" AND metric.labels.state=\"used\""
      threshold_value = 100

      trigger {
        count = 1
      }
    }

    display_name = "VM memory utilization too high"
  }

  display_name = "VM memory utilization too high"
  enabled      = true
  project      = "322260582768"

  user_labels = {
    version        = "1"
    gce_monitoring = "memory_utilization"
  }
}
# terraform import google_monitoring_alert_policy.3556018552176897462 322260582768 projects/322260582768/alertPolicies/3556018552176897462
