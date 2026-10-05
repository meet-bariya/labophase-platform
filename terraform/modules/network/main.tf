resource "civo_network" "this" {
  region  = var.region
  label   = var.name
  cidr_v4 = var.cidr
}

resource "civo_firewall" "this" {
  name                 = var.name
  region               = var.region
  network_id           = civo_network.this.id
  create_default_rules = false

  ingress_rule {
    label      = "kube-api"
    protocol   = "tcp"
    port_range = "6443"
    cidr       = var.api_allowed_cidrs
    action     = "allow"
  }

  ingress_rule {
    label      = "http"
    protocol   = "tcp"
    port_range = "80"
    cidr       = ["0.0.0.0/0"]
    action     = "allow"
  }

  ingress_rule {
    label      = "https"
    protocol   = "tcp"
    port_range = "443"
    cidr       = ["0.0.0.0/0"]
    action     = "allow"
  }

  egress_rule {
    label      = "all"
    protocol   = "tcp"
    port_range = "1-65535"
    cidr       = ["0.0.0.0/0"]
    action     = "allow"
  }
}
