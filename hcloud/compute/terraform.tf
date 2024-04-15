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
    random = {
      source  = "hashicorp/random"
      version = "= 3.6.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "= 5.24.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "= 5.24.0"
    }
  }
  backend "gcs" {
    bucket = "bijlmerdreef733-mc-tf-backend"
    prefix = "compute"
  }
}
