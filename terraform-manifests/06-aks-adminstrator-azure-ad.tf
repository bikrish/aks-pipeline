resource "azuread_user" "aks_admin_user" {
  user_principal_name = "admin1@bikrishgmail.onmicrosoft.com"
  display_name        = "Admin User1"
  mail_nickname       = "Admin"
  password            = "SecretP@sswd99!"
}

resource "azuread_group" "aks_admin_group" {
  display_name     = "${azurerm_resource_group.aks_rg.name}-cluster-admin"
  description      = "Azure AKS Admin for the ${azurerm_resource_group.aks_rg.name}"
  security_enabled = true
}


resource "azuread_group_member" "aks_admin_group_member" {
  group_object_id  = azuread_group.aks_admin_group.id
  member_object_id = azuread_user.aks_admin_user.id
}

