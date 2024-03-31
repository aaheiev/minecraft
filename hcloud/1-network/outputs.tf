output "hcloud_firewall_common_name" {
  value = hcloud_firewall.common.name
}

output "hcloud_firewall_minecraft_name" {
  value = hcloud_firewall.minecraft.name
}

output "hcloud_network_default" {
  value = hcloud_network.network.name
}
