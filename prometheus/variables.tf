variable "namespace" {
  type = string
}

variable "storage" {
  type = string
}

variable "volume_name" {
  type = string
}

variable "name" {
  type = string
}

variable "context_path" {
  type    = string
  default = "/prometheus"
}

variable "deployment_name" {
  type = string
}

variable "retention" {
  type    = string
  default = "30d"
}


variable "service_monitor_selector_apps" {
  type    = list(string)
  default = [
    "kube-state-metrics",
    "node-exporter",
    "kubelet",
    "traefik",
    "pushgateway"
  ]
}


variable "port" {
  type = number
}