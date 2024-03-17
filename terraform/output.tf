 output "public_ip" {
  description = "public ip vm"
  value       = "${azurerm_public_ip.public_ip_1.ip_address}"
}

output "ssh_private_key" {
  value = tls_private_key.key.private_key_pem
  sensitive = true
}

output "ssh_public_key" {
  value = tls_private_key.key.public_key_openssh
} 


  output "acr_login_server" {
  description = "azr endpoint"
  value       = azurerm_container_registry.acr.login_server
}

output "registry_credentials" {
  value = {
    username = azurerm_container_registry.acr.admin_username
    password = azurerm_container_registry.acr.admin_password
  }
  sensitive = true
}
