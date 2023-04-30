resource "kubernetes_namespace" "prom_namespace" {
  metadata {
    name = local.prom_namespace
  }
}