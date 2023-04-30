resource "kubernetes_ingress_v1" "loki_ingress" {
  depends_on             = [kubernetes_namespace.loki_namespace]
  wait_for_load_balancer = true
  metadata {
    name = local.loki_ingress
    annotations = {
      "kubernetes.io/ingress.class" = "gce"
      "nginx.ingress.kubernetes.io/proxy-body-size" : "16m"
    }
    namespace = local.loki_namespace
  }
  spec {
    rule {
      http {
        path {
          path = "/*"
          backend {
            service {
              name = local.loki_service_label
              port {
                number = local.loki_service_port
              }
            }
          }
        }
      }
    }
  }
}