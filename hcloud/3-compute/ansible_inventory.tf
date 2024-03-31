locals {
  ansible_inventory_file_path = "inventory/${terraform.workspace}.hosts.ini"
  ansible_cfg_file_path       = "ansible.cfg"
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../../ansible/${local.ansible_inventory_file_path}"
  content = templatefile("${path.module}/templates/ansible-inventory.ini", {
    env_name       = "${terraform.workspace}",
    mc_server_name = hcloud_server.minecraft_server.name,
    mc_server_ip   = hcloud_server.minecraft_server.ipv4_address
  })
}

resource "local_file" "ansible_cfg" {
  filename = "${path.module}/../../ansible/${local.ansible_cfg_file_path}"
  content = templatefile("${path.module}/templates/ansible.cfg", {
    env_name       = "${terraform.workspace}",
    mc_server_name = hcloud_server.minecraft_server.name,
    mc_server_ip   = hcloud_server.minecraft_server.ipv4_address
  })
}

output "ansible_inventory_file_path" {
  value = "${local.ansible_inventory_file_path}"
}
