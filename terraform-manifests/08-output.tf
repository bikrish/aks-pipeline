output "resource_group_name" {
  value = azurerm_resource_group.aks_rg.name
}

output "location" {
  value = azurerm_resource_group.aks_rg.location
}

output "resource_group_id" {
  value = azurerm_resource_group.aks_rg.id
}


# Azure aks versions
output "versions" {
  value = data.azurerm_kubernetes_service_versions.current.versions
}

output "latest_version" {
  value = data.azurerm_kubernetes_service_versions.current.latest_version
}

output "random_id" {
  value = random_pet.aksrandom.id
}

output "azure_ad_admin_group_id" {
  value = azuread_group.aks_admin_group.id
}

output "azure_ad_admin_group_object_id" {
  value = azuread_group.aks_admin_group.object_id
}


output "aks_cluster_id" {
  value = azurerm_kubernetes_cluster.aks_cluster.id
}


output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks_cluster.name
}


output "aks_cluster_k8s_version" {
  value = azurerm_kubernetes_cluster.aks_cluster.kubernetes_version
}

