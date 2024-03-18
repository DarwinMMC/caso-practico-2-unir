

resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vm"
  resource_group_name = azurerm_resource_group.group_cp2.name
  location            = azurerm_resource_group.group_cp2.location
  size                = "Standard_F2"
  admin_username      = "ansible"
  disable_password_authentication = true
  network_interface_ids = [
    azurerm_network_interface.nic_1.id,
  ]

  admin_ssh_key {
    username   = "ansible"
    public_key = tls_private_key.key.public_key_openssh
  }
  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  tags = {
    enviroment = "cp2"
  }
} 
