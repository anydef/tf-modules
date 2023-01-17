variable "namespace" {
  type = string
}
variable "name" {
  type = string
}
variable "grafana_image" {
  type    = string
}
variable "context_path" {
  type = string
  default = "/grafana"
}

variable "grafana_name" {
  type = string
}

variable "grafana_storage" {
  type = string
}