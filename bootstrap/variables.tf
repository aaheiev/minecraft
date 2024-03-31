variable "gcp_project" {
  type = string
}

variable "tf_backend_google_storage_bucket_name" {
  type    = string
  default = "minecraft-terraform-statestore"
}

variable "tf_backend_google_storage_bucket_location" {
  type    = string
  default = "EUROPE-WEST2"
}

variable "github_sa_name" {
  type = string
  default = "github-iac-workflow"
}

variable "github_repo" {
  type = string
}
