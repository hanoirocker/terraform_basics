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

variable "app_title" {
  description = "Title to display on the Nginx welcome page"
  type        = string
  default     = "Welcome to Terraform Lab!"
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}
