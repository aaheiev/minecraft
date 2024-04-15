locals {
  output_json_file_path = "../../conf/environments/${terraform.workspace}.base.json"
  output_yaml_file_path = "../../conf/environments/${terraform.workspace}.base.yaml"
  outputs = {
    hcloud_ssh_key_name = hcloud_ssh_key.default_ssh_key.name
  }
}

resource "local_file" "output_json" {
  content         = jsonencode(local.outputs)
  file_permission = 0644
  filename        = local.output_json_file_path
}

/*
resource "local_file" "output_yaml" {
  content         = yamlencode(local.outputs)
  file_permission = 0644
  filename        = local.output_yaml_file_path
}
*/
