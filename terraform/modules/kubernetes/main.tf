resource "civo_kubernetes_cluster" "this" {
  name               = var.name
  region             = var.region
  network_id         = var.network_id
  firewall_id        = var.firewall_id
  cluster_type       = "k3s"
  kubernetes_version = var.kubernetes_version
  applications       = var.applications
  write_kubeconfig   = true

  pools {
    label      = var.name
    size       = var.node_size
    node_count = var.node_count
  }
}