terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
      version = "~>2.9.1"
    }
  }
}
resource "scaleway_instance_volume" "volume" {
    type       = "b_ssd"
    name       = var.name
    size_in_gb = 30
}