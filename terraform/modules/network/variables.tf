variable "name" {
  type = string
}

variable "region" {
  type = string
}

variable "cidr" {
  type    = string
  default = "10.10.0.0/24"
}

variable "api_allowed_cidrs" {
  type        = list(string)
  description = "CIDRs allowed to reach the Kubernetes API"
}