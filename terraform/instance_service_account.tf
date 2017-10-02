resource "google_service_account" "rss-instance-service-account" {
  provider = "google.us-central1"
  account_id   = "rss-vms"
}

data "google_iam_policy" "rss-instance-service-account-iam-policy" {
  provider = "google.us-central1"
  binding {
    role = "roles/storage.objectViewer"

    members = [
      "serviceAccount:${google_service_account.rss-instance-service-account.email}",
    ]
  }
}

resource "google_project_iam_policy" "rss-instance-project-iam-policy" {
  provider = "google.us-central1"
  project     = "${var.google_project_id}"
  policy_data = "${data.google_iam_policy.rss-instance-service-account-iam-policy.policy_data}"
}