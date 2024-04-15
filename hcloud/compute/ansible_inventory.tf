locals {
  ansible_inventory_file_path = "inventory/${terraform.workspace}.hosts.ini"
  ansible_cfg_file_path       = "ansible.cfg"
}

resource "local_file" "ansible_inventory" {
  filename        = "${path.module}/../../ansible/${local.ansible_inventory_file_path}"
  file_permission = "0644"
  content = templatefile("${path.module}/templates/ansible-inventory.ini", {
    env_name       = "${terraform.workspace}",
    mc_server_name = hcloud_server.minecraft_server.name,
    mc_server_ip   = hcloud_server.minecraft_server.ipv4_address
  })
}

resource "local_file" "ansible_cfg" {
  filename        = "${path.module}/../../ansible/${local.ansible_cfg_file_path}"
  file_permission = "0644"
  content = templatefile("${path.module}/templates/ansible.cfg", {
    env_name       = "${terraform.workspace}",
    mc_server_name = hcloud_server.minecraft_server.name,
    mc_server_ip   = hcloud_server.minecraft_server.ipv4_address
  })
}

resource "local_file" "minecraft_host_vars" {
  filename        = "${path.module}/../../ansible/host_vars/${hcloud_server.minecraft_server.name}.yaml"
  file_permission = "0644"
  content = templatefile("${path.module}/templates/host_vars.yaml", {
    minecraft_volume_linux_device = "${var.hcloud_volume_minecraft_linux_device}"
  })
}
