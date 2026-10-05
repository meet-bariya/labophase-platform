output "id" {
  value = civo_kubernetes_cluster.this.id
}

output "api_endpoint" {
  value = civo_kubernetes_cluster.this.api_endpoint
}

output "kubeconfig" {
  value     = civo_kubernetes_cluster.this.kubeconfig
  sensitive = true
}
