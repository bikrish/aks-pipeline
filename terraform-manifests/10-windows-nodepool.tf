# resource "azurerm_kubernetes_cluster_node_pool" "windows_pool" {
#   name                  = "win101"
#   kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
#   vm_size               = "Standard_B2s"
#   node_count            = 1
#   enable_auto_scaling   = true
#   min_count             = 1
#   max_count             = 2
#   mode                  = "User"
#   orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
#   os_type               = "Windows"
#   os_disk_size_gb       = 30
#   vnet_subnet_id        = azurerm_subnet.aks-default-subnet.id
#   node_labels = {
#     "nodepool-type" = "user"
#     "nodepoolos"    = "windows"
#     "environment"   = "produciton"
#     "app"           = "dotnet-apps"
#   }

#   tags = {
#     "nodepool-type" = "user"
#     "nodepoolos"    = "windows"
#     "environment"   = "produciton"
#     "app"           = "dotnet-apps"
#   }
# }