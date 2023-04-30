resource "helm_release" "loki" {
  depends_on = [kubernetes_namespace.loki_namespace]
  name       = local.loki_helm_release_name
  repository = "https://grafana.github.io/helm-charts"
  chart      = "loki-stack"
  namespace  = local.loki_namespace

  values = [
    file("${path.module}/values/loki-stack.yaml")
  ]
}