locals {
  output_json_file_path = "../compute/${terraform.workspace}.storage.auto.json"
  output_yaml_file_path = "../../conf/environments/${terraform.workspace}.storage.yaml"
  outputs = {
    hcloud_volume_minecraft_data_name    = hcloud_volume.minecraft_data.name
    hcloud_volume_minecraft_linux_device = hcloud_volume.minecraft_data.linux_device
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
