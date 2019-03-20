provider "kubernetes" {
  # Get this value from your Kubeconfig
  config_context_cluster   = "gke_roger-chao-gcp_us-west2-b_k8s-cluster"
}

#resource "kubernetes_namespace" "team3" {
#  count = "${var.enrollment}"
#  metadata {
#    name = "${element(var.students, count.index)}"
#  }
#}


resource "helm_release" "vault" {
    count     = "${var.enrollment}"
    name      = "vault-${count.index}"
    chart     = "../vault-chart"
    namespace = "${element(var.students, count.index)}"
}

resource "kubernetes_pod" "class" {
  count = "${var.enrollment}"
  depends_on = ["helm_release.vault"]
  metadata {
    name = "${var.className}-class-${count.index}"
    annotations {
       "studentName" = "${element(var.students, count.index)}" 
    }
    namespace = "${element(var.students, count.index)}"
  }

  spec {
    container {
      image = "rogman/wetty"
      name  = "wetty-${element(var.students, count.index)}"

    }
  }
}
