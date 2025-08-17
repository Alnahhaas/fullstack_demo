terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      # version = "v3.6"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
    }
    helm = {
      source  = "hashicorp/helm"
      # version = "v3.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}

provider "docker" {}


# ----------------------------
# Docker Images
# ----------------------------

resource "docker_image" "backend" {
  name = "alnahhaas/fullstack_demo_backend:latest"

  build {
    context    = "../backend"
    dockerfile = "Dockerfile"
  }

  keep_locally = false  # push automatically to Docker Hub
}

resource "docker_image" "frontend" {
  name = "alnahhaas/fullstack_demo_frontend:latest"

  build {
    context    = "../frontend"
    dockerfile = "Dockerfile"
  }

  keep_locally = false
}

# ----------------------------
# Helm Release
# ----------------------------

resource "helm_release" "fullstack_demo" {
  name       = "fullstack-demo"
  chart      = "../helm-chart"   # path to your local Helm chart
  namespace  = "default"

  set = [
    {
      name  = "frontend.image"
      value = docker_image.frontend.name
    },
    {
      name  = "backend.image"
      value = docker_image.backend.name
    },
    {
      name  = "ingress.enabled"
      value = true
    },
    {
      name  = "ingress.host"
      value = "myapp.local"
    }
  ]
}
