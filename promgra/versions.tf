terraform {
  required_version = ">= 0.13"

  required_providers {
    aws        = ">= 3.13, < 4.0"
    helm       = ">= 1.0, < 3.0"
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.11.0"
    }
  }
}


provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "do-sfo3-k8s-1-24-4-do-0-sfo3-1667661477975"
}
