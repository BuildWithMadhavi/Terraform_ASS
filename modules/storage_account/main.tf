resource "azurerm_storage_account" "this" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type

  allow_blob_public_access = false
  min_tls_version          = "TLS1_2"
  enable_https_traffic_only = true

  network_rules {
    default_action = "Allow"
  }

  tags = var.tags
}
