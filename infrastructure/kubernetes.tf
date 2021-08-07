data "linode_region" "eu-central" {
  id = "eu-central"
}

resource "linode_lke_cluster" "openfaas-cluster" {
  label       = "openfaas-cluster"
  k8s_version = "1.21"
  region      = data.linode_region.eu-central.id
  tags = [
    "openfaas"
  ]

  pool {
    type  = "g6-standard-2"
    count = 3
  }
}

resource "local_file" "kubeconfig" {
  content  = base64decode(linode_lke_cluster.openfaas-cluster.kubeconfig)
  filename = "kubeconfig"
}