resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "${azurerm_resource_group.aks_rg.name}-cluster"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "${azurerm_resource_group.aks_rg.name}-cluster"
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  node_resource_group = "${azurerm_resource_group.aks_rg.name}-node-group"

  default_node_pool {
    name                 = "systempool"
    vm_size              = "Standard_B2s"
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    enable_auto_scaling  = true
    min_count            = 1
    max_count            = 2
    os_disk_size_gb      = 30
    type                 = "VirtualMachineScaleSets"
    vnet_subnet_id       = azurerm_subnet.aks-default-subnet.id
    node_labels = {
      "nodepool-type" = "system"
      "nodepoolos"    = "linux"
      "app"           = "system-apps"
      "environment"   = "dev"
    }
    tags = {
      "nodepool-type" = "system"
      "nodepoolos"    = "linux"
      "app"           = "system-apps"
      "environment"   = "dev"
    }
  }

  identity {
    type = "SystemAssigned"
  }

  addon_profile {
    azure_policy {
      enabled = true
    }
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = azurerm_log_analytics_workspace.insights.id
    }
  }

  role_based_access_control {
    enabled = true
    azure_active_directory {
      managed                = true
      admin_group_object_ids = [azuread_group.aks_admin_group.object_id]
      azure_rbac_enabled     = true
    }
  }

  windows_profile {
    admin_username = var.windows_admin_username
    admin_password = var.windows_admin_password
  }

  linux_profile {
    admin_username = "bikrish"
    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "Standard"
  }

  tags = {
    Environment = "Production"
  }



}