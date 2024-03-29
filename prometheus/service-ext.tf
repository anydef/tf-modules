resource "kubernetes_manifest" "service_monitoring_prometheus_external" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "name" = "external-${var.name}"
      "namespace" = var.namespace
      "labels" = {
        "app" = var.name
      }
    }
    "spec" = {
#      "loadBalancerIP" = "192.168.0.205"
      "ports" = [
        {
          "name" = "web"
          "port" = var.port
          "protocol" = "TCP"
          "targetPort" = 9090
        },
      ]
      "selector" = {
        "prometheus" = var.deployment_name
      }
      "type" = "LoadBalancer"
    }
  }
}
