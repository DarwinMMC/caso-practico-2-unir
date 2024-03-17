 
 resource "tls_private_key" "aks_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "cluster"
  location            = azurerm_resource_group.group_cp2.location
  resource_group_name = azurerm_resource_group.group_cp2.name
  dns_prefix          = "darwin-aks"

  default_node_pool {
    name       = "controlplane"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  linux_profile {
    admin_username = "ansible"

    ssh_key {
      key_data = tls_private_key.aks_key.public_key_openssh
    }
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "cp2"
  }
}


