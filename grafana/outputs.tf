output "datasources_enabled" {
  value = grafana_data_source.loki_datasource.name
}

output "graphana_details" {
  value = grafana_cloud_stack.my_stack
}