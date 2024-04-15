data "google_dns_managed_zone" "env_dns_zone" {
  name    = var.gcloud_dns_zone_name
  project = var.gcloud_project
}

resource "google_dns_record_set" "minecraft_a" {
  project      = var.gcloud_project
  name         = "mc.${data.google_dns_managed_zone.env_dns_zone.dns_name}"
  type         = "A"
  ttl          = 300
  managed_zone = data.google_dns_managed_zone.env_dns_zone.name
  rrdatas      = [hcloud_server.minecraft_server.ipv4_address]
}

resource "google_dns_record_set" "minecraft_aaaa" {
  project      = var.gcloud_project
  name         = "mc.${data.google_dns_managed_zone.env_dns_zone.dns_name}"
  type         = "AAAA"
  ttl          = 300
  managed_zone = data.google_dns_managed_zone.env_dns_zone.name
  rrdatas      = [hcloud_server.minecraft_server.ipv6_address]
}

/*
output "env_dns_zone" {
  value = data.google_dns_managed_zone.env_dns_zone
}

output "mc_pip_v4" {
  value = hcloud_server.minecraft_server.ipv4_address
}

output "mc_pip_v6" {
  value = hcloud_server.minecraft_server.ipv6_address
}
*/
