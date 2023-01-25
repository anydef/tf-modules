resource "kubernetes_manifest" "service_monitoring_prometheus_external" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "name" = "prometheus-external"
      "namespace" = var.namespace
    }
    "spec" = {
#      "loadBalancerIP" = "192.168.0.205"
      "ports" = [
        {
          "name" = "web"
          "port" = var.port
          "protocol" = "TCP"
          "targetPort" = var.port
        },
      ]
      "selector" = {
        "prometheus" = var.deployment_name
      }
      "type" = "LoadBalancer"
    }
  }
}
