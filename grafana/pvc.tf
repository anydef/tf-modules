resource "kubernetes_persistent_volume_claim_v1" "grafana" {
  metadata {
    name      = "grafana"
    namespace = var.namespace
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = var.grafana_storage
      }
    }
    volume_name        = var.grafana_name
    storage_class_name = "nfs"
  }
}
