output "loki_endpoint" {
  value = kubernetes_ingress_v1.loki_ingress.status.0.load_balancer.0.ingress.0.ip
}