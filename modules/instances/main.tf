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
resource "scaleway_instance_server" "mes-instances" {
  count = var.instance_count
  type = var.instance_type
  name = "${var.name_student}-${count.index}"
  image = "ubuntu_focal"
  # additional_volume_ids = [scaleway_instance_volume.server_volume[var.volume_count].id]
}
