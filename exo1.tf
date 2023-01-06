terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
      version = "2.9.0"
    }
  }
}

provider "scaleway" {
  # Configuration options
  zone   = "fr-par-1"
  region = "fr-par"
}
# Private pn_priv
resource "scaleway_vpc_private_network" "pn_priv" {
    name = "pn_priv"

}
# Instance DEV-S
resource "scaleway_instance_server" "mes-instances-DEV1-S" {
  count = 3
  type = "DEV1-S"
  name = "dan-${count.index}"
  image = "ubuntu_focal"
}
# Instance DEV-XL
resource "scaleway_instance_server" "mes-instances-DEV1-XL" {
  image = "ubuntu_focal"
  type  = "DEV1-XL"
  name = "dan-${count.index}"
}
resource "scaleway_instance_volume" "server_volume" {
    type       = "l_ssd"
    name       = "petit-volume"
    size_in_gb = 30
}
# Attachement du volume à l'instance DEV1-S
resource "scaleway_instance_volume_attachment" "mes-instances-DEV1-S" {
  instance_id = scaleway_instance_server.mes-instances-DEV1-S.id
  volume_id   = scaleway_volume.server_volume.id
}
# Attachement du volume à l'instance DEV1-XL
resource "scaleway_instance_volume_attachment" "mes-instances-DEV1-XL" {
  instance_id = scaleway_instance_server.mes-instances-DEV1-XL.id
  volume_id   = scaleway_volume.server_volume.id
}