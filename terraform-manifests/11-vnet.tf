resource "azurerm_virtual_network" "aks-vnet" {
  name                = "${azurerm_resource_group.aks_rg.name}-vnet"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  address_space       = ["10.0.0.0/8"]
}

resource "azurerm_subnet" "aks-default-subnet" {
  name                 = "aks-default-subnet"
  resource_group_name  = azurerm_resource_group.aks_rg.name
  virtual_network_name = azurerm_virtual_network.aks-vnet.name
  address_prefixes     = ["10.1.0.0/16"]
}

