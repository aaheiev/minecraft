terraform {
  required_version = "= 1.7.5"
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "= 1.45.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "= 2.5.1"
    }
  }
  backend "gcs" {
    bucket = "minecraft-terraform-statestore"
    prefix = "compute"
  }
}
