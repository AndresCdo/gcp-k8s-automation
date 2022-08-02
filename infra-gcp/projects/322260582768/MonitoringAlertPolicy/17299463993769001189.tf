resource "google_monitoring_alert_policy" "17299463993769001189" {
  combiner = "OR"

  conditions {
    condition_threshold {
      aggregations {
        alignment_period   = "300s"
        per_series_aligner = "ALIGN_MEAN"
      }

      comparison      = "COMPARISON_GT"
      duration        = "300s"
      filter          = "metric.type=\"agent.googleapis.com/disk/percent_used\" AND resource.type=\"gce_instance\" AND metric.labels.state=\"used\""
      threshold_value = 95

      trigger {
        count = 1
      }
    }

    display_name = "VM disk utilization too high"
  }

  display_name = "VM disk utilization too high"
  enabled      = true
  project      = "322260582768"

  user_labels = {
    gce_monitoring = "disk_utiization"
    version        = "1"
  }
}
# terraform import google_monitoring_alert_policy.17299463993769001189 322260582768 projects/322260582768/alertPolicies/17299463993769001189
