terraform {
  required_providers {
    civo = {
      source  = "civo/civo"
      version = "1.3.2"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.38"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 3.0"
    }

  }
  required_version = ">= 1.6"
}

provider "civo" {
  region = var.region
}

locals {
  kubeconfig = yamldecode(module.kubernetes.kubeconfig)
}

provider "helm" {
  kubernetes = {
    host                   = local.kubeconfig.clusters[0].cluster.server
    cluster_ca_certificate = base64encode(local.kubeconfig.clusters[0].cluster["certificate-authority-data"])
    client_ca_certificate  = base64encode(local.kubeconfig.users[0].user["client-certificate-data"])
    client_key             = base64encode(local.kubeconfig.users[0].user["client-key-data"])
  }
}
