resource "google_service_account" "github_workflow_sa" {
  account_id = var.github_sa_name
  project    = var.gcp_project
}
