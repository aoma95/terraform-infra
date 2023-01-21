output "instance" {
   value = "xpdrt"
  sensitive   = false
  description = "description"
  depends_on  = []
}
# si output module string 
# output "server_name" {
#   value =  [for key,value in module.Create_instance : value.var1]
# }


# si output module est un objet
output "server" {
  value =  [for key,value in module.Create_instance : value.instance]
}






# output "varia" {
#    value = ["module.Create_instance.var1",var.instances]
#   sensitive   = false
#   description = "descripdtion"
#   depends_on  = []
# }
