resource "kubernetes_manifest" "deployment_monitoring_prometheus_operator" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "labels" = {
        "app.kubernetes.io/component" = "controller"
        "app.kubernetes.io/name" = "prometheus-operator"
        "app.kubernetes.io/version" = "0.59.2"
      }
      "name" = "prometheus-operator"
      "namespace" = var.namespace
    }
    "spec" = {
      "replicas" = 1
      "selector" = {
        "matchLabels" = {
          "app.kubernetes.io/component" = "controller"
          "app.kubernetes.io/name" = "prometheus-operator"
        }
      }
      "template" = {
        "metadata" = {
          "annotations" = {
            "kubectl.kubernetes.io/default-container" = "prometheus-operator"
          }
          "labels" = {
            "app.kubernetes.io/component" = "controller"
            "app.kubernetes.io/name" = "prometheus-operator"
            "app.kubernetes.io/version" = "0.59.2"
          }
        }
        "spec" = {
          "automountServiceAccountToken" = true
          "containers" = [
            {
              "args" = [
                "--kubelet-service=kube-system/kubelet",
                "--prometheus-config-reloader=quay.io/prometheus-operator/prometheus-config-reloader:v0.59.2",
              ]
              "image" = "quay.io/prometheus-operator/prometheus-operator:v0.59.2"
              "name" = "prometheus-operator"
              "ports" = [
                {
                  "containerPort" = 8080
                  "name" = "http"
                },
              ]
              "resources" = {
                "limits" = {
                  "cpu" = "200m"
                  "memory" = "200Mi"
                }
                "requests" = {
                  "cpu" = "100m"
                  "memory" = "100Mi"
                }
              }
              "securityContext" = {
                "allowPrivilegeEscalation" = false
                "capabilities" = {
                  "drop" = [
                    "ALL",
                  ]
                }
                "readOnlyRootFilesystem" = true
              }
            },
          ]
          "nodeSelector" = {
            "kubernetes.io/os" = "linux"
          }
          "securityContext" = {
            "runAsNonRoot" = true
            "runAsUser" = 65534
          }
          "serviceAccountName" = "prometheus-operator"
        }
      }
    }
  }
}
