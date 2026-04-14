output "container_id" {
  description = "ID del contenedor crteado"
  value = docker_container.nginx.id
}

output web_url {
  description = "URL para acceder al servidor"
  value = "http://localhost:${var.external_port}"
}