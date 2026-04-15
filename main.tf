terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

# Provider configuration
provider "docker" {}

# 1. Define the Nginx image
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

# 2. Create the container using that image
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = var.container_name

  ports {
    internal = 80
    external = var.external_port
  }

  volumes {
    host_path      = abspath("${path.module}/index.html") # PC route (absolute)
    container_path = "/usr/share/nginx/html/index.html"   # Internal Nginx path
    read_only      = true
  }

  networks_advanced {
    name = docker_network.private_network.name
  }
}

# 3. Private network
resource "docker_network" "private_network" {
  name = "private_network_lab"
}
