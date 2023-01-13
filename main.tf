# variable "instance_type_1"{}
# variable "name_student"{}
# variable "instance_type_2"{}

module "Create_volume" {
    source = "./modules/volumes"
    size_volume = 30
    name_volume = "le_volume_Dan"
    count_volume = var.instance_DEV1_S + var.instance_DEV1_XL
}
output "output_count" {
  value = module.Create_volume.volume_ids
}

#Crée les instances
module "Create_instance_DEV1-S" {
    source = "./modules/instances"
    instance_type = "DEV1-S"
    instance_count = var.instance_DEV1_S
}
module "Create_instance_DEV1-XL" {
    source = "./modules/instances"
    instance_type= "DEV1-XL"
    instance_count= var.instance_DEV1_XL

}