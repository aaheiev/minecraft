terraform {
  required_version = "= 1.8.0"
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "= 1.46.1"
    }
    local = {
      source  = "hashicorp/local"
      version = "= 2.5.1"
    }
  }
  backend "gcs" {
    bucket = "bijlmerdreef733-mc-tf-backend"
    prefix = "storage"
  }
}
