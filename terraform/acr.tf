resource "azurerm_container_registry" "acr" {
  name                = "containerRegistryDarwin"
  resource_group_name = azurerm_resource_group.group_cp2.name
  location            = azurerm_resource_group.group_cp2.location
  sku                 = "Basic"
  admin_enabled       = true
}
