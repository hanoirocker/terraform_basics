variable "container_name" {
  description = "Nombre para el contenedor de Nginx"
  type = string
  default = "servidor-terraform-lab"
}

variable "external_port" {
  description = "Puerto externo para acceder a Nginx"
  type = number
  default = 8080
}