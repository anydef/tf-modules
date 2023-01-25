resource "kubernetes_manifest" "service_monitoring_prometheus" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "name" = var.name
      "namespace" = var.namespace
      "labels" = {
        "app" = var.name
      }
    }
    "spec" = {
      "ports" = [
        {
          "name" = "web"
          "port" = 9090
          "targetPort" = "web"
        },
      ]
      "selector" = {
        "prometheus" = var.deployment_name
      }
      "sessionAffinity" = "ClientIP"
    }
  }
}
