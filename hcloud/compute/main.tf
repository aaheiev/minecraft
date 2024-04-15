module "global_config" {
  source      = "../../modules/yaml_config"
  config_path = "${path.module}/../../conf/${terraform.workspace}.yaml"
}
