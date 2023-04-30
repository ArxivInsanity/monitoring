resource "helm_release" "prom" {
  depends_on = [kubernetes_namespace.prom_namespace]
  name       = local.prom_helm_release_name
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  namespace  = local.prom_namespace

  values = [
    file("${path.module}/values/prom-stack.yaml")
  ]
}