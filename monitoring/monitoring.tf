#Resources are declared here

module "loki" {
  source = "./loki"
}

module "prometheus" {
  source = "./prometheus"
}