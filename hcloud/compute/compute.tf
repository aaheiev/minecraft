data "hcloud_firewall" "common" {
  name = var.hcloud_firewall_common_name
}

data "hcloud_firewall" "minecraft" {
  name = var.hcloud_firewall_minecraft_name
}

data "hcloud_ssh_key" "default" {
  name = module.global_config.config["ssh_key"]["name"]
}

data "hcloud_volume" "minecraft_data" {
  name = module.global_config.config["minecraft"]["storage"]["data_volume_name"]
}

resource "random_integer" "minecraft_server_id" {
  min  = 111
  max  = 999
  seed = terraform.workspace
}

locals {
  minecraft_server_name = "${module.global_config.config["minecraft"]["server"]["name"]}-${random_integer.minecraft_server_id.result}"
}

resource "hcloud_server" "minecraft_server" {
  name        = local.minecraft_server_name
  image       = module.global_config.config["minecraft"]["server"]["os"]
  location    = module.global_config.config["location"]
  server_type = module.global_config.config["minecraft"]["server"]["type"]
  firewall_ids = [
    data.hcloud_firewall.common.id,
    data.hcloud_firewall.minecraft.id
  ]
  ssh_keys = [
    data.hcloud_ssh_key.default.id
  ]
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
  lifecycle {
    ignore_changes = [
      network
    ]
  }
}

resource "hcloud_volume_attachment" "minecraft_server_data" {
  volume_id = data.hcloud_volume.minecraft_data.id
  server_id = hcloud_server.minecraft_server.id
  automount = true
}
