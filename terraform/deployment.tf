resource "kubernetes_deployment" "fastapi_app" {
  metadata {
    name      = var.app_name
    namespace = var.namespace
    labels = {
      app = var.app_name
    }
    annotations = {
      "dapr.io/enabled"  = "true"
      "dapr.io/app-id"   = var.app_name
      "dapr.io/app-port" = "8000"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = var.app_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_name
        }
        annotations = {
          "dapr.io/enabled"  = "true"
          "dapr.io/app-id"   = var.app_name
          "dapr.io/app-port" = "8000"
        }
      }

      spec {
        container {
          name  = var.app_name
          image = var.container_image
          image_pull_policy = "IfNotPresent"

          ports {
            container_port = 8000
          }
        }
      }
    }
  }
}

