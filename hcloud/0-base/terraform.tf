terraform {
  required_version = ">= 1.7.1, < 1.8.0"
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = ">= 1.45.0, < 2.0.0"
    }
  }
  backend "gcs" {
    bucket = "minecraft-terraform-statestore"
    prefix = "base"
  }
}
