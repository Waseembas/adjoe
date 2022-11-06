


# Install ECK operator via helm-charts



#resource "helm_release" "elastic" {
#  name = "elastic-operator"

#  repository       = "https://helm.elastic.co"
#  chart            = "eck-operator"
#  namespace        = "elastic-system"
#  create_namespace = "true"

 # depends_on = [google_container_cluster._, google_container_node_pool.node-pool, kubernetes_cluster_role_binding.cluster-admin-binding]

#}




# Delay of 30s to wait until ECK operator is up and running
#resource "time_sleep" "wait_30_seconds" {
#  depends_on = [helm_release.elastic]

#  create_duration = "30s"
#}



# Create Elasticsearch manifest
resource "kubectl_manifest" "elastic_quickstart" {
    yaml_body = file("./template/cluster.yml")



  provisioner "local-exec" {
     command = "sleep 60"
  }
}



# Create Kibana manifest
resource "kubectl_manifest" "kibana_quickstart" {
    yaml_body = file("./template/kibana-deployment.yaml")

  provisioner "local-exec" {
     command = "sleep 60"
  }
  depends_on = [kubectl_manifest.elastic_quickstart]
}


resource "kubectl_manifest" "file_beat" {
    yaml_body = file("./template/filebeat-ds.yaml")

  provisioner "local-exec" {
     command = "sleep 60"
  }
  depends_on = [kubectl_manifest.kibana_quickstart]
}




#resource "kubectl_manifest" "my_crds" {
#  yaml_body = file("${path.root}/my_crds.yaml")
#}




