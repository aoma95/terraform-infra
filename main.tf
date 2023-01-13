# variable "instance_type_1"{}
# variable "name_student"{}
# variable "instance_type_2"{}
module "Create_instance_DEV1-S" {
    source = "./modules/instance"
    instance_type= "DEV1-XL"
    instance_count=3
}