output "resource_group_id" {
  value = module.rg.resource_group_id
}

output "storage_account_endpoint" {
  value = module.storage.primary_blob_endpoint
}

output "vnet_id" {
  value = module.vnet.vnet_id
}

output "subnet_id" {
  value = module.vnet.subnet_id
}

output "key_vault_uri" {
  value = module.keyvault.key_vault_uri
}
