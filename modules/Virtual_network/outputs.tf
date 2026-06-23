output "vnet_id" {
  description = "VNet ID"
  value       = azurerm_virtual_network.this.id
}

output "subnet_id" {
  description = "Subnet ID"
  value       = azurerm_subnet.default.id
}
