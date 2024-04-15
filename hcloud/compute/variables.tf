variable "gcloud_project" {
  type = string
}

variable "gcloud_dns_zone_name" {
  type = string
}

variable "hcloud_token" {
  type      = string
  sensitive = true
}

variable "hcloud_firewall_common_name" {
  type    = string
  default = "common"
}

variable "hcloud_firewall_minecraft_name" {
  type    = string
  default = "minecraft"
}

variable "hcloud_volume_minecraft_data_name" {
  type    = string
  default = "minecraft-data"
}

variable "hcloud_volume_minecraft_linux_device" {
  type = string
}
