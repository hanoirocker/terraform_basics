terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4.0"
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
    host_path      = abspath(local_file.index_html_rendered.filename) # PC route (absolute)
    container_path = "/usr/share/nginx/html/index.html"               # Internal Nginx path
    read_only      = true
  }

  networks_advanced {
    name = docker_network.private_network.name
  }

  depends_on = [local_file.index_html_rendered]
}

# 3. Private network
resource "docker_network" "private_network" {
  name = "private_network_lab"
}

# 4. Generate index.html file with dynamic content
# Generar el archivo index.html final
resource "local_file" "index_html_rendered" {
  content = templatefile("${path.module}/index.tftpl", {
    app_title   = var.app_title
    environment = var.environment
  })
  filename = "${path.module}/index.html"
}
