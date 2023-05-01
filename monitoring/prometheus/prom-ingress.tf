resource "kubernetes_ingress_v1" "prom_ingress" {
  depends_on             = [kubernetes_namespace.prom_namespace, helm_release.prom]
  wait_for_load_balancer = true
  metadata {
    name = local.prom_ingress
    annotations = {
      "kubernetes.io/ingress.class" = "gce"
      "nginx.ingress.kubernetes.io/proxy-body-size" : "16m"
    }
    namespace = local.prom_namespace
  }
  spec {
    rule {
      http {
        path {
          path = "/*"
          backend {
            service {
              name = local.prom_service_label
              port {
                number = local.prom_service_port
              }
            }
          }
        }
      }
    }
  }
}