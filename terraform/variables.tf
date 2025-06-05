variable "namespace" {
  description = "Kubernetes namespace to deploy the app"
  type        = string
  default     = "fastapi-dapr"
}

variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "fastapi-app"
}

variable "container_image" {
  description = "Docker image for the FastAPI app"
  type        = string
  default     = "fastapi-dapr-app"  # Change this to your Docker Hub image if needed
}

