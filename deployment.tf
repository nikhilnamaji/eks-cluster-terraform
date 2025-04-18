resource "kubernetes_service" "simpletimeservice" {
  metadata {
    name      = "simpletimeservice-service"
    namespace = "default"
  }

  spec {
    selector = {
      app = kubernetes_deployment.simpletimeservice.metadata[0].labels.app
    }

    type = "LoadBalancer"

    port {
      port        = 80
      target_port = 5000
    }
  }
}