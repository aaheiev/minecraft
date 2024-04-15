data "google_dns_managed_zone" "env_dns_zone" {
  name    = var.dns_zone_name
  project = var.gcp_project
}

resource "google_dns_managed_zone_iam_binding" "binding" {
  project      = var.gcp_project
  managed_zone = data.google_dns_managed_zone.env_dns_zone.name
  role         = "roles/dns.admin"
  members      = ["serviceAccount:${google_service_account.github_workflow_sa.email}"]
}
