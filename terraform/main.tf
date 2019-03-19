

resource "helm_release" "vault" {
    name      = "team3"
    chart     = "../vault-chart"
}
