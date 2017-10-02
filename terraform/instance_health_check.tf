resource "google_compute_http_health_check" "rss-instance-health-check" {
  provider = "google.us-central1"
  name = "rss-instance-health-check"

  timeout_sec        = 5
  check_interval_sec = 15
  healthy_threshold = 2
  unhealthy_threshold = 3
  port = 80
  request_path = "/health"
}