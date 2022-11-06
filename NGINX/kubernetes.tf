terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.11.0"
    }
      kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}








#provider "kubernetes" {
#  host = var.host
#  client_certificate     = var.client_certificate
#  client_key             = var.client_key
#  cluster_ca_certificate = var.cluster_ca_certificate
#}



provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "do-sfo3-k8s-1-24-4-do-0-sfo3-1667661477975"
}