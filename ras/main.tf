variable "servers" {
  default = {
    app = 2
    es = 3
  }
}

locals {
  firstname = "alexandre"
  # Generate list of servers name
  servers = concat(                                           # Merge all hostnames lists
     [for i in range(3) : {name = "Dan_DEV1_S${i+1}", image_vm = "ubuntu_focal", type = "DEV1-S"}],
     [{name = "Dan_DEV1_XL1", image_vm = "ubuntu_focal", type = "DEV1-XL"}]                                                      # Use items reference (spread operator)
  )
}