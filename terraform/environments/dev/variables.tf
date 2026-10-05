variable "region" {
  description = "Civo Region"
  type        = string
  default     = "MUM1"
}

variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "api_allowed_cidrs" {
  type = list(string)
}

variable "node_size" {
  type = string
}

variable "node_count" {
  type = number
}
