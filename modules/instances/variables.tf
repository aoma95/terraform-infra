variable "instance_type" {
  description = "type de l'instance"
  type = string
}
# variable "instance_count" {
#   type = number
# }
variable "name_student" {
  description = "Prénom étudiant"
  type = string
  default = "Dan"
}
variable "image" {
  description = "Image de l'instance"
  type = string
}
# variable "name_volume" {
#   type = string
#   default = "Dan"
# }
# variable "servers" {
#   type = list(object({
#     name = string
#     image = string
#     type = string
#     volume_name = string
#     volume_size = number
#   }))
#     default = [
#     {name = "Dan_DEV1_S_1", image = "ubuntu_focal", type = "DEV1-S", volume_name = "volume_s_1",volume_size=20},
#     {name = "Dan_DEV1_S_2", image = "ubuntu_focal", type = "DEV1-S", volume_name = "volume_s_2",volume_size=20},
#     {name = "Dan_DEV1_S_3", image = "ubuntu_focal", type = "DEV1-S", volume_name = "volume_s_3",volume_size=20},
#     {name = "Dan_DEV1_XL_1", image = "ubuntu_focal", type = "DEV1-XL", volume_name = "volume_xl_1",volume_size=20}
  # ]
  # default = [
  #   for i in range(3) : {name = "Dan_DEV1_S${i+1}", image = "ubuntu_focal", type = "DEV1-S"}
  # ] + [
  #   {name = "Dan_DEV1_XL1", image = "ubuntu_focal", type = "DEV1-XL"}
  # ]
# }