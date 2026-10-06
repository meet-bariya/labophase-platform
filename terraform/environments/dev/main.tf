locals {
  name = "${var.project}-${var.environment}"
}

module "network" {
  source = "../../modules/network"

  name              = local.name
  region            = var.region
  cidr              = "10.10.0.0/24"
  api_allowed_cidrs = var.api_allowed_cidrs
}


module "kubernetes" {
  source = "../../modules/kubernetes"

  name        = local.name
  region      = var.region
  network_id  = module.network.network_id
  firewall_id = module.network.firewall_id
  node_size   = var.node_size
  node_count  = var.node_count
}

module "argocd" {
  source = "../../modules/argocd"

  repo_url = var.gitops_repo_url
  path = "kubernetes/clusters/${var.environment}"
  argocd_chart_version = var.argocd_chart_version
  argocd_apps_chart_version = var.argocd_apps_chart_version
}
