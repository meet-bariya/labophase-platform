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
