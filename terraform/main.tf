provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "sonnen_1st" {
  name       = "sonnen1st"
  chart      = "../helm-chart" 
  namespace  = "default"

}
