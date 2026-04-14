output "container_id" {
  description = "ID of the created container"
  value       = docker_container.nginx.id
}

output "web_url" {
  description = "URL to access the server"
  value       = "http://localhost:${var.external_port}"
}
