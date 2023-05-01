resource "kubernetes_service" "prom_service" {
  depends_on = [kubernetes_namespace.prom_namespace, helm_release.prom]
  metadata {
    name      = local.prom_service_label
    namespace = local.prom_namespace
  }
  spec {
    selector = {
      "app.kubernetes.io/name" = "prometheus"
      prometheus               = "prom-kube-prometheus-stack-prometheus"
    }
    port {
      port        = local.prom_service_port
      target_port = local.prom_service_port
    }

    type = "NodePort"
  }
}
