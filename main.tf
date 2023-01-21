#Crée les instances
terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "~> 2.9.1"
    }
  }
  required_version = "~> 1.3.0"
}

module "Create_instance" {
    for_each = {
      for instance in var.instances : instance.name => instance
      }
    source = "./modules/instances"
    # for_each = {for instance in var.instances : instance.name => instance}
    name = each.value.name
    image = each.value.image_vm
    type = each.value.type




}
