terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

# Configuración del proveedor
provider "docker" {}

# 1. Definir la imagen de Nginx
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

# 2. Crear el contenedor usando esa imagen
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "mi-servidor-web"

  ports {
    internal = 80
    external = 8080
  }
}
