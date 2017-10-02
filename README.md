# rss.lasyk.info

Provisioner and automation for my TinyTinyRSS sevice on GCP

Simply `terraform apply` contents of the **terraform** directory.

This will create a free f1-micro instance in GCP managed by instance
group and autoscaler (think High Availability and self - healing, 
download and install [TinyTinyRSS](https://tt-rss.org/) and copy my 
latest backups.

It will also install provided SSL certs and configure systemd timers
that updates periodically RSS feeds.