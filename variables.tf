variable "container_name" {
  description = "Name for the Nginx container"
  type        = string
  default     = "terraform-lab-server"
}

variable "external_port" {
  description = "External port to access Nginx"
  type        = number
  default     = 8085
}
