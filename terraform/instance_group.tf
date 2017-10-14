resource "google_compute_instance_group_manager" "rss-instance-group-manager" {
  provider = "google.us-central1"
  name               = "rss-instance-group-manager"
  instance_template  = "${google_compute_instance_template.rss-instance-template.self_link}"
  base_instance_name = "rss-instance-group"
  zone               = "${var.region}-b"

  named_port {
    name = "http"
    port = 80
  }

  auto_healing_policies {
    health_check = "${google_compute_http_health_check.rss-instance-health-check.self_link}"
    initial_delay_sec = 600
  }
}