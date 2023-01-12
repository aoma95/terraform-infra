terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
      version = "2.9.0"
    }
  }
}
variable "volume_count" {
  type = number
}
variable "instance_type_1" {
  type = string
  default = "DEV1-S"
}
variable "instance_type_2" {
  type = string
  default = "DEV1-XL"
}
variable "instance_count_1" {
  type = number
  default = 3
}
variable "instance_count_2" {
  type = number
  default = 1
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
  count = var.instance_count_1
  type = var.instance_type_1
  name = "dan-${count.index}"
  image = "ubuntu_focal"
  additional_volume_ids = [scaleway_instance_volume.server_volume[count.index].id]
  private_network {
    pn_id = scaleway_vpc_private_network.pn_priv.id
  }

}
# Instance DEV-XL
resource "scaleway_instance_server" "mes-instances-DEV1-XL" {
  count = var.instance_count_2
  image = "ubuntu_focal"
  type  = var.instance_type_2
  name = "dan-${count.index}"
  additional_volume_ids = [scaleway_instance_volume.server_volume[var.instance_count+count.index].id]
  private_network {
    pn_id = scaleway_vpc_private_network.pn_priv.id
  }
  
}
resource "scaleway_instance_volume" "server_volume" {
    type       = "l_ssd"
    count = var.instance_count_1 + var.instance_count_2
    name       = "petit-volume-${count.index}"
    size_in_gb = 30
}
# Attachement du volume à l'instance DEV1-S
# resource "scaleway_instance_volume_attachment" "mes-instances-DEV1-S" {
#   instance_id = scaleway_instance_server.mes-instances-DEV1-S.id
#   volume_id   = scaleway_volume.server_volume.id
# }
# Attachement du volume à l'instance DEV1-XL
# resource "scaleway_instance_volume_attachment" "mes-instances-DEV1-XL" {
#   instance_id = scaleway_instance_server.mes-instances-DEV1-XL.id
#   volume_id   = scaleway_volume.server_volume.id
# }
# resource "scaleway_instance_nic" "mes-instances-DEV1-S" {
#   count = 3
#   instance_id = scaleway_instance_server.mes-instances-DEV1-S.id
#   private_network_id = scaleway_vpc_private_network.pn_priv.id
#   ip_address = "192.168.0.${count.index + 1}"
# }
# # NIC pour l'instance DEV-XL
# resource "scaleway_instance_nic" "mes-instances-DEV1-XL" {
#   instance_id = scaleway_instance_server.mes-instances-DEV1-XL.id
#   private_network_id = scaleway_vpc_private_network.pn_priv.id
#   ip_address = "192.168.0.4"
# }
# Provisionning pour l'installation de Docker sur les instances DEV-S
# resource "null_resource" "install-docker-dev1-s" {
  # count = 3
  # connection {
    # host = scaleway_instance_server.mes-instances-DEV1-S[count.index].ip_address
    # user = "root"
    # private_key = file("~/.ssh/id_rsa")
  # }
  # provisioner "remote-exec" {
    # inline = [
      # "apt-get update",
      # "apt-get install -y docker.io"
    # ]
  # }
# }
# Provisionning pour l'installation de Docker sur l'instance DEV-XL
# resource "null_resource" "install-docker-dev1-xl" {
  # connection {
    # host = scaleway_instance_server.mes-instances-DEV1-XL.ip_address
    # user = "root"
    # private_key = file("~/.ssh/id_rsa")
  # }
  # provisioner "remote-exec" {
    # inline = [
      # "apt-get update",
      # "apt-get install -y docker.io"
    # ]
  # }
# }