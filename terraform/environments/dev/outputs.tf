output "cluster_name" {
  value = local.name
}

output "api_endpoint" {
  value = module.kubernetes.api_endpoint
}

output "kubeconfig" {
  value     = module.kubernetes.kubeconfig
  sensitive = true
}
