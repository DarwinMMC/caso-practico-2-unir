
resource "azurerm_network_security_group" "securityGroup" {
  name                = "acceptanceTestSecurityGroup1"
  location            = azurerm_resource_group.group_cp2.location
  resource_group_name = azurerm_resource_group.group_cp2.name
}

resource "azurerm_network_security_rule" "ssh" {
  name                        = "AllowAnySSHInbound"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.group_cp2.name
  network_security_group_name = azurerm_network_security_group.securityGroup.name
}


resource "azurerm_network_security_rule" "httprule" {
  name                        = "AllowAnyHTTPInbound"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.group_cp2.name
  network_security_group_name = azurerm_network_security_group.securityGroup.name
}

resource "azurerm_network_security_rule" "httsprule" {
  name                        = "AllowAnyHTTPSInbound"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.group_cp2.name
  network_security_group_name = azurerm_network_security_group.securityGroup.name
}



resource "azurerm_network_interface_security_group_association" "associationsecuritygroup1" {
  network_interface_id      = azurerm_network_interface.nic_1.id
  network_security_group_id = azurerm_network_security_group.securityGroup.id
}
