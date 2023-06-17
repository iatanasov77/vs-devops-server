output "container_url" {
  description   = "Open Container On This Port."
  value         = docker_container.nginx.ports[0].external
}
