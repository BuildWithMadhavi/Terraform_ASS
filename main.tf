terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

provider "azurerm" {
  features = {}
}

locals {
  env = terraform.workspace
}

module "rg" {
  source   = "./modules/resource_group"
  name     = "${var.prefix}-${local.env}-rg"
  location = var.location
  tags     = var.tags
}

module "storage" {
  source              = "./modules/storage_account"
  name                = lower(replace("${var.prefix}${local.env}sa", "-", ""))
  resource_group_name = module.rg.resource_group_name
  location            = var.location
  tags                = var.tags
}

module "vnet" {
  source              = "./modules/virtual_network"
  name                = "${var.prefix}-${local.env}-vnet"
  resource_group_name = module.rg.resource_group_name
  location            = var.location
  address_space       = var.vnet_address_space
  subnet_prefix       = var.vnet_subnet_prefix
}

module "keyvault" {
  source              = "./modules/key_vault"
  name                = "${var.prefix}-${local.env}-kv"
  resource_group_name = module.rg.resource_group_name
  location            = var.location
  tenant_id           = var.tenant_id
}
