resource "google_compute_instance_template" "rss-instance-template" {
  provider = "google.us-central1"
  name = "rss-instance-template"
  machine_type = "f1-micro"
  region       = "${var.region}"

  can_ip_forward       = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  metadata {
    startup-script-url = "gs://${google_storage_bucket.rss-cloud_storage_bucket.name}/${google_storage_bucket_object.rss-nginx_startup.name}"
  }

  disk {
    source_image = "centos-cloud/centos-7"
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = "${google_compute_address.rss-ip-address.address}"
    }
  }

  tags = ["http-server"]

  lifecycle {
    create_before_destroy = true
  }

  service_account {
    email = "${google_service_account.rss-instance-service-account.email}"
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}