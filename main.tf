#Crée les instances
module "Create_instance" {
    source = "./modules/instances"
    for_each = var.instances
    name = each.value.name
    image = each.value.image
    type = each.value.type

}