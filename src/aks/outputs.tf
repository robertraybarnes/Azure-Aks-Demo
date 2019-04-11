output "cluster_id" {
  value = "${azurerm_kubernetes_cluster.aksdemocluster.id}"
}

output "cluster_fqdn" {
  value = "${azurerm_kubernetes_cluster.aksdemocluster.fqdn}"
}

output "cluster_raw_config" {
  value = "${azurerm_kubernetes_cluster.aksdemocluster.kube_config_raw}"
}

output "cluster_client_key" {
  value = "${azurerm_kubernetes_cluster.aksdemocluster.kube_config.0.client_key}"
}

output "client_certificate" {
  value = "${azurerm_kubernetes_cluster.aksdemocluster.kube_config.0.client_certificate}"
}

output "cluster_ca_certificate" {
  value = "${azurerm_kubernetes_cluster.aksdemocluster.kube_config.0.cluster_ca_certificate}"
}

output "cluster_host" {
  value = "${azurerm_kubernetes_cluster.aksdemocluster.kube_config.0.host}"
}

output "cluster_username" {
  value = "${azurerm_kubernetes_cluster.aksdemocluster.kube_config.0.username}"
}

output "cluster_password" {
  value = "${azurerm_kubernetes_cluster.aksdemocluster.kube_config.0.password}"
}

output "cr_server_url" {
  value = "${azurerm_container_registry.aksdemo_cr.login_server}"
}

output "cr_id" {
  value = "${azurerm_container_registry.aksdemo_cr.id}"
}

output "cr_admin_username" {
  value = "${azurerm_container_registry.aksdemo_cr.admin_username}"
}

output "cr_admin_password" {
  value = "${azurerm_container_registry.aksdemo_cr.admin_password}"
}
