resource "kubernetes_namespace" "loki_namespace" {
  metadata {
    name = local.loki_namespace
  }
}