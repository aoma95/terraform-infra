# variable "instance_type" {
#   type = string
# }
# variable "instance_count" {
#   type = number
# }
# variable "name_student" {
#   type = string
#   default = "Dan"
# }
# variable "name_volume" {
#   type = string
#   default = "Dan"
# }
variable "servers" {
  type = list(object({
    name = string
    image = string
    type = string
  }))
    default = [
    {name = "Dan_DEV1_S_1", image = "ubuntu_focal", type = "DEV1-S"},
    {name = "Dan_DEV1_S_2", image = "ubuntu_focal", type = "DEV1-S"},
    {name = "Dan_DEV1_S_3", image = "ubuntu_focal", type = "DEV1-S"},
    {name = "Dan_DEV1_XL_1", image = "ubuntu_focal", type = "DEV1-XL"}
  ]
  # default = [
  #   for i in range(3) : {name = "Dan_DEV1_S${i+1}", image = "ubuntu_focal", type = "DEV1-S"}
  # ] + [
  #   {name = "Dan_DEV1_XL1", image = "ubuntu_focal", type = "DEV1-XL"}
  # ]
}