output "instance" {
  value = {
    name = scaleway_instance_server.instance.name
    image = scaleway_instance_server.instance.image
    type = scaleway_instance_server.instance.type
  }
  description = "instance generate"
}
