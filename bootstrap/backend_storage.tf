resource "google_storage_bucket" "terraform_backend" {
  name                        = var.tf_backend_google_storage_bucket_name
  project                     = var.gcp_project
  location                    = var.tf_backend_google_storage_bucket_location
  uniform_bucket_level_access = true
  labels                      = {}
}

resource "google_storage_bucket_iam_member" "bucket_admin" {
  bucket = google_storage_bucket.terraform_backend.name
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.github_workflow_sa.email}"
}
