data "google_compute_network" "rss-default-network" {
  provider = "google.us-central1"
  name = "default"
}

resource "google_compute_firewall" "rss-firewall" {
  provider = "google.us-central1"
  name    = "rss-firewall"
  network = "${data.google_compute_network.rss-default-network.name}"

  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  source_tags = ["http-server", "https-server"]
}

resource "google_compute_address" "rss-ip-address" {
  provider = "google.us-central1"
  name = "rss-ip-address"
  region = "${var.region}"
}