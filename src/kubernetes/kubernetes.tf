resource "kubernetes_secret" "azurecr" {
  metadata {
      name = "azurecr"
  }

  data {
      username = "${var.ENC__cr_sp_client_id}"
      password = "${var.ENC__cr_sp_client_secret}"
  }

  type = "kubernetes.io/basic-auth"
}

resource "null_resource" "kube_manifest" {
    provisioner "local-exec" {
        command = "kubectl apply -f azure-voting-app-redis/azure-vote-all-in-one-redis.yaml"
    }
}


