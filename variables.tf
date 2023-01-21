variable "instances" {
  type = list(object({
    name = string
    image_vm = string
    type = string
    volume_name = string
    volume_size = number
  }))
    default = [
    {name = "Dan_DEV1_S_1", image_vm = "ubuntu_focal", type = "DEV1-S", volume_name = "volume_s_1",volume_size=20},
    {name = "Dan_DEV1_S_2", image_vm = "ubuntu_focal", type = "DEV1-S", volume_name = "volume_s_2",volume_size=20},
    {name = "Dan_DEV1_S_3", image_vm = "ubuntu_focal", type = "DEV1-S", volume_name = "volume_s_3",volume_size=20},
    {name = "Dan_DEV1_XL_1", image_vm = "ubuntu_focal", type = "DEV1-XL", volume_name = "volume_xl_1",volume_size=20}
  ]
#     default = [
#      [for i in range(3) : {name = "Dan_DEV1_S${i+1}", image_vm = "ubuntu_focal", type = "DEV1-S"}],
#      [{name = "Dan_DEV1_XL1", image_vm = "ubuntu_focal", type = "DEV1-XL"}]
#   ]
}
# variable "instances" {
#   description = "Map of instance to create"
#   type = map(object({
#     name  = string
#     type  = string
#     image = string
#   }))
# }



# variable "testop" {
#   type = list(string)
#   default = ["10","11"]
# }