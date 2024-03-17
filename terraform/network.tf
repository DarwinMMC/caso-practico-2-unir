resource "azurerm_virtual_network" "network_1" {
  name                = "network_1"
  location            = azurerm_resource_group.group_cp2.location
  resource_group_name = azurerm_resource_group.group_cp2.name
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = "Production"
  }
}


resource "azurerm_subnet" "subnet_1" {
  name                 = "subnet_1"
  resource_group_name  = azurerm_resource_group.group_cp2.name
  virtual_network_name = azurerm_virtual_network.network_1.name
  address_prefixes     = ["10.0.1.0/24"]
}


resource "azurerm_public_ip" "public_ip_1" {
  name                = "public_ip_1"
  resource_group_name = azurerm_resource_group.group_cp2.name
  location            = azurerm_resource_group.group_cp2.location
  allocation_method   = "Dynamic"
  sku                 = "Basic"
  tags = {  
    environment = "cp2"
  }
}


resource "azurerm_network_interface" "nic_1" {
  name                = "nic_1"
  resource_group_name = azurerm_resource_group.group_cp2.name
  location            = azurerm_resource_group.group_cp2.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet_1.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.10"
    public_ip_address_id          =  azurerm_public_ip.public_ip_1.id
  }
} 

