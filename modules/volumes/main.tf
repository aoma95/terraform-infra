terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
      version = "2.9.0"
    }
  }
}

resource "scaleway_instance_volume" "server_volume" {
    type       = "b_ssd"
    count = var.count_volume
    name       = "${var.name_volume}-${count.index}"
    size_in_gb = var.size_volume
}
output "volumes" {
  value = values(scaleway_instance_volume.server_volume.*.id)
}