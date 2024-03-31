variable "hcloud_token" {
  type      = string
  sensitive = true
}

variable "firewall_common_name" {
  type    = string
  default = "common"
}

variable "firewall_minecraft_name" {
  type    = string
  default = "minecraft"
}
