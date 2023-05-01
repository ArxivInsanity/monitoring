output "datasources_enabled" {
  value = [grafana_data_source.loki_datasource.name, grafana_data_source.prom_datasource.name]
}

output "graphana_details" {
  value = grafana_cloud_stack.my_stack
}

output "dashboards" {
  value = {
    Kubernetes_pods     = grafana_dashboard.pod_metrics.url
    Kubernetes_workload = grafana_dashboard.workload_metrics.url
    Application_logs    = grafana_dashboard.application_logs.url
  }
}