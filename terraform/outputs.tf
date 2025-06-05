output "service_ip" {
  description = "The external IP of the FastAPI service"
  value       = kubernetes_service.fastapi_service.status[0].load_balancer[0].ingress[0].ip
}

