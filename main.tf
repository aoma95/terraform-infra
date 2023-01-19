#Crée les instances
module "Create_instance" {
    source = "./modules/instances"
    for_each = {for s in var.instances : s.name => s}
    name = each.value.name
    image = each.value.image
    type = each.value.type

}