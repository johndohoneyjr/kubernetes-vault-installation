provider "kubernetes" {
  # Get this value from your Kubeconfig
  config_context_cluster   = "gke_roger-chao-gcp_us-west2-b_k8s-cluster"
}

resource "kubernetes_namespace" "team3" {
  metadata {
    name = "roger"
  }
}

resource "kubernetes_pod" "class" {
  count = "${var.enrollment}"

  metadata {
    name = "team3-class"
#    student = "${element(var.students, count.index)}"
  }

  spec {
    container {
      image = "wetty"
      name  = "wetty-${element(var.students, count.index)}"

    }
  }
}
