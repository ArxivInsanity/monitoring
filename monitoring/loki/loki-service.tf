resource "kubernetes_service" "loki_service" {
  depends_on = [kubernetes_namespace.loki_namespace]
  metadata {
    name      = local.loki_service_label
    namespace = local.loki_namespace
  }
  spec {
    selector = {
      app  = "loki"
      name = "loki"
    }
    port {
      port        = local.loki_service_port
      target_port = local.loki_service_port
    }

    type = "NodePort"
  }
}
