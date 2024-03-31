resource "hcloud_volume" "minecraft_data" {
  name              = module.global_config.config["minecraft"]["storage"]["data_volume_name"]
  size              = module.global_config.config["minecraft"]["storage"]["data_volume_size_gb"]
  location          = module.global_config.config["location"]
  delete_protection = module.global_config.config["minecraft"]["storage"]["data_volume_delete_protection"]
  format            = "ext4"
}
