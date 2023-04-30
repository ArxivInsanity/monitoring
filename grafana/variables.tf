variable "grafana_auth" {}

variable "loki_url" {
  description = "The endpoint for the loki data source"
}
variable "prom_url" {
  description = "The endpoint for the prometheus data source"
}