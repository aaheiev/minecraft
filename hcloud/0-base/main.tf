module "global_config" {
  source      = "../../modules/yaml_config"
  config_path = "${path.module}/../../conf/${terraform.workspace}.yaml"
}

resource "hcloud_ssh_key" "default_ssh_key" {
  name       = module.global_config.config["ssh_key"]["name"]
  public_key = file(module.global_config.config["ssh_key"]["file_path"])
}
