variable "name" {
  type = string
}

variable "region" {
  type = string
}

variable "network_id" {
  type = string
}

variable "firewall_id" {
  type = string
}

variable "kubernetes_version" {
  type    = string
  default = null
}

variable "node_size" {
  type = string
}

variable "node_count" {
  type = number
}

variable "applications" {
  type    = string
  default = "-traefik2-nodeport"
}