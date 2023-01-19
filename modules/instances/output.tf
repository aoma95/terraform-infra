output "instance_ids" {
  value = [for s in scaleway_instance_server.server : s.id]
  description = "liste des ids généré par scalway"
}