output "prom_endpoint" {
  value = kubernetes_ingress_v1.prom_ingress.status.0.load_balancer.0.ingress.0.ip
}