resource "google_storage_bucket" "terraform_backend" {
  name     = var.tf_backend_google_storage_bucket_name
  location = var.tf_backend_google_storage_bucket_location
  labels   = {}
}

resource "google_service_account" "github_workflow_sa" {
  account_id = var.github_sa_name
  project    = var.gcp_project
}

resource "google_storage_bucket_iam_member" "bucket_admin" {
  bucket = google_storage_bucket.terraform_backend.name
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.github_workflow_sa.email}"
}

resource "google_iam_workload_identity_pool" "github_identity_pool" {
  project                   = var.gcp_project
  workload_identity_pool_id = "github-pool"
  display_name              = "Github Minecraft"
  description               = "Identity pool for Github Minecraft access"
  disabled                  = false
}

resource "google_iam_workload_identity_pool_provider" "github_identity_provider" {
  project                            = var.gcp_project
  workload_identity_pool_id          = google_iam_workload_identity_pool.github_identity_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-minecraft"
  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.repository" = "assertion.repository"
  }
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}


resource "google_service_account_iam_member" "github_workflow_sa_workload_identity" {
  service_account_id = google_service_account.github_workflow_sa.id
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github_identity_pool.id}/subject/repo:${var.github_repo}:ref:refs/heads/main"

}
/*
principal://iam.googleapis.com/projects/<project_number>/locations/global/workloadIdentityPools/POOL_ID/subject/repo:PradeepSingh1988/gcp-wif:ref:refs/heads/main
*/

output "github_identity_pool" {
  value = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github_identity_pool.id}/subject/repo:${var.github_repo}:ref:refs/heads/main"
}

#gcloud iam workload-identity-pools providers create-oidc githubwif \
#  --location="global" --workload-identity-pool="github-wif-pool"  \
#  --issuer-uri="https://token.actions.githubusercontent.com" \
#  --attribute-mapping="attribute.actor=assertion.actor,google.subject=assertion.sub,attribute.repository=assertion.repository" \
#  --project aaheiev-335511
