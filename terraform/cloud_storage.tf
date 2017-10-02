resource "google_storage_bucket" "rss-cloud_storage_bucket" {
  provider = "google.us-central1"
  name     = "${var.rss-cloud_storage_bucket_name}"
  location = "US"
  storage_class = "MULTI_REGIONAL"
}

resource "google_storage_bucket_acl" "rss-cloud_storage_bucket-acl" {
  provider = "google.us-central1"
  bucket = "${google_storage_bucket.rss-cloud_storage_bucket.name}"
  depends_on = ["google_service_account.rss-instance-service-account"]

  role_entity = [
    "READER:user-${google_service_account.rss-instance-service-account.email}"
  ]
}

resource "google_storage_bucket_object" "rss-nginx_startup" {
  provider = "google.us-central1"
  name   = "rss_startup.sh"
  source = "${path.module}/scripts/rss_startup.sh"
  bucket = "${google_storage_bucket.rss-cloud_storage_bucket.name}"
}

resource "google_storage_bucket_object" "rss-nginx_health_check_conf" {
  provider = "google.us-central1"
  name   = "rss-nginx_health_check.conf"
  source = "${path.module}/scripts/nginx_health_check.conf"
  bucket = "${google_storage_bucket.rss-cloud_storage_bucket.name}"
}