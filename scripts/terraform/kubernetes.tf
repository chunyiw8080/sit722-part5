resource "azurerm_kubernetes_cluster" "kubernetes_cluster" {
  name = var.app_name
  location = var.location
  resource_group_name = azurerm_resource_group.deakinuni.name
  dns_prefix = var.app_name
  kubernetes_version = var.kubernetes_version

  default_node_pool {
    name = "default"
    node_count = 1
    vm_size = "standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "role_assignment" {
  #Allow kubelet component on kubernetes cluster to pull image from container registry
  principal_id = azurerm_kubernetes_cluster.kubernetes_cluster.kubelet_identity[0].object_id
  scope = azurerm_container_registry.container_registry.id
  role_definition_name = "AcrPull"
  skip_service_principal_aad_check = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.kubernetes_cluster.kube_config_raw
  sensitive = true
}