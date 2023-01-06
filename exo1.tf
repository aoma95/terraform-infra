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
resource "scaleway_instance_server" "mes-instances-DEV1-S" {
  count         = 3
  type          = "DEV1-S"
  name          = "instance-${count.index}"
  image         = "ubuntu_focal"
}