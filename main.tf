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
locals{
  instances = {
    for instance in var.instances : instance.name => instance
  }
}
module "Create_instance" {
  for_each = local.instances
    source = "./modules/instance"
    # for_each = {for instance in var.instances : instance.name => instance}
    name = each.value.name
    image = each.value.image_vm
    type = each.value.type
    volume_id = module.Create_volume[each.key].volume_id

}
module "Create_volume"{
  for_each = local.instances
  source = "./modules/volume"
  name = "volume-${each.key}"
}
