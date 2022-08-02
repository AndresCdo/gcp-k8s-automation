resource "google_monitoring_alert_policy" "13484187987458198430" {
  combiner = "OR"

  conditions {
    condition_threshold {
      aggregations {
        alignment_period     = "300s"
        cross_series_reducer = "REDUCE_PERCENTILE_95"
        group_by_fields      = ["resource.labels.instance_id", "resource.labels.project_id", "resource.labels.zone"]
        per_series_aligner   = "ALIGN_SUM"
      }

      comparison      = "COMPARISON_GT"
      duration        = "180s"
      filter          = "metric.type=\"networking.googleapis.com/vm_flow/rtt\" AND resource.type=\"gce_instance\""
      threshold_value = 20000

      trigger {
        count = 1
      }
    }

    display_name = "VM p95 networking latency too high"
  }

  display_name = "VM p95 networking latency too high"
  enabled      = true
  project      = "322260582768"

  user_labels = {
    version        = "1"
    gce_monitoring = "p95_response_latency"
  }
}
# terraform import google_monitoring_alert_policy.13484187987458198430 322260582768 projects/322260582768/alertPolicies/13484187987458198430
