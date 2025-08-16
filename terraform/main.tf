provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "fullstack_demo" {
  name       = "sonnen1st"
  chart      = "../helm-chart" 
  namespace  = "default"

}
