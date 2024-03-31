resource "hcloud_network" "network" {
  name     = module.global_config.config["network"]["name"]
  ip_range = module.global_config.config["network"]["ip_range"]
}

resource "hcloud_network_subnet" "subnet_eu_central" {
  type         = "cloud"
  network_id   = hcloud_network.network.id
  network_zone = "eu-central"
  ip_range     = module.global_config.config["network"]["subnets"]["eu_central"]["ip_range"]
}
