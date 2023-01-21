terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
      version = "~>2.9.1"
    }
  }
}

resource "scaleway_instance_server" "instance" {
  # for_each = var.instance
  type = var.type
  name =  var.name
  image =  var.image
}
# resource "scaleway_instance_volume" "server_volume" {
#     type       = "b_ssd"
#     count = var.instance_count
#     name       = "${var.name_volume}-${count.index}"
#     size_in_gb = var.size_volume
# }
# resource "scaleway_instance_server" "mes-instances" {
#   count = var.instance_count
#   type = var.instance_type
#   name = "${var.name_student}-${count.index}"
#   image = "ubuntu_focal"
#   additional_volume_ids = [scaleway_instance_volume.server_volume[var.volume_count].id]
# }


# resource "scaleway_instance_server" "server" {
#   for_each = {for s in var.servers : s.name => s}
#   name = each.value.name
#   image = each.value.image
#   type = each.value.type
# }
# resource "scaleway_volume" "volume" {
#     for_each = {for s in var.servers : s.name => s}
#     name = each.value.volume_name
#     size_in_gb = each.value.volume_size
# }
