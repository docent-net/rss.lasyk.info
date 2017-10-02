terraform {
  required_version = ">= 0.10.4"
  backend "gcs" {
    bucket = "ml-terraform-states"
    path = "rss.lasyk.info"
    project = "rss-lasyk-info"
  }
}

variable google_project_id {
  type = "string"
  default = "rss-lasyk-info"
}

variable region {
  type = "string"
  default = "us-central1"
}

provider "google" {
  project = "${var.google_project_id}"
  region = "${var.region}"
  alias = "us-central1"
}

variable rss-cloud_storage_bucket_name {
  type = "string"
  default = "ml-rss-lasyk-info"
}
