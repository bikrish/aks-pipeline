# resource "azurerm_kubernetes_cluster_node_pool" "linux_pool" {
#   name                  = "linux101"
#   kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
#   vm_size               = "Standard_B2s"
#   node_count            = 1
#   enable_auto_scaling   = true
#   min_count             = 1
#   max_count             = 2
#   mode                  = "User"
#   orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
#   os_type               = "Linux"
#   vnet_subnet_id        = azurerm_subnet.aks-default-subnet.id
#   node_labels = {
#     "nodepool-type" = "user"
#     "nodepoolos"    = "linux"
#     "environment"   = "produciton"
#     "app"           = "java-apps"
#   }

#   tags = {
#     "nodepool-type" = "user"
#     "nodepoolos"    = "linux"
#     "environment"   = "produciton"
#     "app"           = "java-apps"
#   }
# }