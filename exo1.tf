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